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
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Str;
use Illuminate\Support\Carbon;
use App\Mail\ResetPasswordMail;

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

    public function changePassword()
    {
        return view('front.changePassword');
    }
    public function passwordChange(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'old_password' => 'required',
            'new_password' => 'required',
            'confirm_password' => 'required|same:new_password',
        ]);
        if ($validate->passes()) {
            $user = auth()->user();
            $dbUser = User::find($user->id);
            $check1 = Hash::check($request->old_password, $user->password);
            $check2 = Hash::check($request->old_password, $dbUser->password);

            if ($user && ($check1 || $check2)) {
                $user->password = Hash::make($request->new_password);
                $user->save();
                session()->flash('success', 'Password updated');
                return response()->json([
                    'status' => true,
                    'message' => 'Password updated'
                ]);
            } else {
                return response()->json([
                    'status' => false,
                    'errors' => ['old_password' => 'Old password is incorrect']
                ]);
            }
        } else {
            return response()->json([
                'status' => false,
                'errors' => $validate->errors()
            ]);
        }
    }

    public function forgetPassword()
    {
        return view('front.auth.forgetPassword');
    }
    public function forgetPasswordAction(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'email' => 'required|email|exists:users,email',
        ]);
        if ($validate->passes()) {
            $user = User::where('email', $request->email)->first();
            $token = Str::random(60);
            DB::table('password_reset_tokens')->where('email', $request->email)->delete();
            DB::table('password_reset_tokens')->insert([
                'email' => $request->email,
                'token' => $token,
                'created_at' => Carbon::now()
            ]);
            $formData = [
                'token' => $token,
                'user' => $user,
                'subject' => 'Reset Password'
            ];
            Mail::to($request->email)->send(new ResetPasswordMail($formData));
            return redirect()->back()->with('success', 'Password reset link sent to your email');
        }
        return redirect()->back()->withErrors($validate->errors())->withInput($request->only('email'));
    }

    public function resetPassword($token)
    {
        $tokenData = DB::table('password_reset_tokens')->where('token', $token)->first();
        if (!$tokenData) {
            return redirect()->route('userLogin')->with('error', 'Invalid token');
        }
        return view('front.auth.resetPassword', ['token' => $token]);
    }
    public function resetPasswordAction(Request $request)
    {
        $validate = Validator::make($request->all(), [
            'password' => 'required|min:8',
            'password_confirmation' => 'required|same:password',
        ]);
        if ($validate->passes()) {
            $token = $request->token;
            $tokenData = DB::table('password_reset_tokens')->where('token', $token)->first();
            if (!$tokenData) {
                return redirect()->route('userLogin')->with('error', 'Invalid token');
            }
            $user = User::where('email', $tokenData->email)->first();
            $user->password = Hash::make($request->password);
            $user->save();
            DB::table('password_reset_tokens')->where('email', $tokenData->email)->delete();
            return redirect()->route('userLogin')->with('success', 'Password updated');
        }
        return redirect()->back()
            ->withErrors($validate->errors())
            ->withInput($request->only('password', 'password_confirmation'));
    }
}
