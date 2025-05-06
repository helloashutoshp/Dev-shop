<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use App\Mail\PasswordChangeMail;
use App\Models\Admin;

class adminController extends Controller
{
    public function index()
    {
        return view('admin.login');
    }

    public function authenticate(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required'
        ]);
        if ($validator->passes()) {
            if (Auth::guard('admin')->attempt(['email' => $request->email, 'password' => $request->password], $request->get('remember'))) {
                $admin = Auth::guard('admin')->user();
                if ($admin->role == 0) {
                    return redirect()->route('admin-dashboard');
                } else {
                    $admin = Auth::guard('admin')->logout();
                    return redirect()->route('admin-login')->with('error', 'You are not authorize');
                }
            } else {
                return redirect()->route('admin-login')->with('error', 'Invalid email or password');
            }
        } else {
            return redirect('/admin/login')->withErrors($validator)->withInput($request->only('email'));
        }
    }
    public function changePassword()
    {
        return view('admin.changePassword');
    }

    public function passwordChange(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'old_password' => 'required',
            'new_password' => 'required',
            'confirm_password' => 'required|same:new_password',
        ]);

        if ($validate->fails()) {
            return response()->json([
                'status' => false,
                'errors' => $validate->errors()
            ]);
        }
        $user = auth('admin')->user();
        if (!Hash::check($request->old_password, $user->password)) {
            return response()->json([
                'status' => false,
                'errors' => ['old_password' => 'The old password is incorrect']
            ]);
        }
        $user->password = Hash::make($request->new_password);
        $user->save();
        session()->flash('success', 'Password updated successfully');
        return response()->json([
            'status' => true,
            'message' => 'Password updated successfully'
        ]);
    }
}
