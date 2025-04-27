<?php

namespace App\Http\Controllers\front;

use App\Http\Controllers\Controller;
use App\Models\CountryModel;
use App\Models\User;
use App\Models\userShipping;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class authController extends Controller
{
    public function login()
    {
        return view('front.auth.login');
    }

    public function loginAction(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required'
        ]);


        if ($validate->passes()) {
            $user = User::where('email', $request->email)->first();

            // dd(Hash::check($request->password, $user->password));


            // dd($request->password);
            if (Auth::attempt(['email' => $request->email, 'password' => $request->password], $request->get('remember'))) {
                // dd("hello");
                // $admin = Auth::guard('admin')->user();
                // if ($admin->role == 1) {
                if ((session()->has('url.checkout'))) {
                    // dd(session()->get('url.checkout'));
                    return redirect(session()->get('url.checkout'));
                }
                return redirect()->route('user-profile');
                // } else {
                // $admin = Auth::guard('admin')->logout();
                //     return redirect()->back()->with('error', 'You are not authorize');
                // }
            } else {
                session()->flash('error', 'Invalid Crdential');
                return redirect()->route('userLogin');
            }
        } else {
            return redirect()->back()->withErrors($validate->errors())->withInput($request->only('email'));
        }
    }

    public function register()
    {
        return view('front.auth.register');
    }

    public function store(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email|unique:users',
            'phone' => 'required|digits:10',
            'password' => 'required|min:8',
            'cpassword' => 'required|same:password',
        ], [
            'phone.digits' => 'Please enter a valid phone number',
            'phone.number' => 'Please enter a valid phone number',
            'email.unique' => 'Email already exit'
        ]);

        if ($validate->passes()) {
            $user = new User();
            $user->name = $request->name;
            $user->email = $request->email;
            $user->phone = $request->phone;
            $user->password = Hash::make($request->password);
            $user->save();
            session()->flash('success', 'Account created');
            return response()->json([
                'status' => true,
                'message' => 'Validation done'
            ]);
        } else {
            return response()->json([
                'status' => false,
                'errors' => $validate->errors()
            ]);
        }
    }

    public function profile()
    {
        $user = Auth::id();
        $user = User::find($user);
        $address = userShipping::where('user_id', $user->id)->first();
        $country = CountryModel::all();
        return view('front.profile', ['user' => $user, 'address' => $address, 'country' => $country]);
    }
    public function logout()
    {
        Auth::logout();
        return view('front.auth.login');
    }

    public function profileUpdate(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'name' => 'required',
            'phone' => 'required|digits:10',
        ]);

        if ($validate->passes()) {
            $user = User::find($request->user_id);
            $user->name = $request->name;
            $user->phone = $request->phone;
            $user->save();
            session()->flash('success', 'Profile updated');
            return response()->json([
                'status' => true,
                'message' => 'Profile updated'
            ]);
        } else {
            return response()->json([
                'status' => false,
                'errors' => $validate->errors()
            ]);
        }
    }
    public function addressUpdate(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'country' => 'required',
            'address' => 'required',
            'appartment' => 'required',
            'city' => 'required',
            'state' => 'required',
            'zip' => 'required',
            'address_mobile' => 'required|digits:10',
        ]);
        if ($validate->passes()) {
            $address = userShipping::updateOrCreate(
                ['id' => $request->address_id],
                [
                    'country_id' => $request->country,
                    'address' => $request->address,
                    'appartment' => $request->appartment,
                    'city' => $request->city,
                    'state' => $request->state,
                    'zip' => $request->zip,
                    'mobile' => $request->address_mobile,
                    'user_id' => auth()->id(),
                ]
            );
            session()->flash('success', 'Address updated');
            return response()->json([
                'status' => true,
                'message' => 'Address updated'
            ]);
        }
        return response()->json([
            'status' => false,
            'errors' => $validate->errors()
        ]);
    }
}
