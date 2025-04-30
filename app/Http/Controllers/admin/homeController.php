<?php

namespace App\Http\Controllers\admin;

use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;

class homeController extends Controller
{
    public function index()
    {
        // $admin = Auth::guard('admin')->user();
        // echo 'Welcome' . $admin->name . '<a href="' . route('admin-logout') . '">Logout</a>';
        return view('admin.dashboard');
    }
    public function logout()
    {
        $admin = Auth::guard('admin')->logout();
        return redirect()->route('admin-login');
    }

    public function users(Request $request)
    {
        $keyword = $request->get('keyword');
        $query = User::where('role', 1);
        if (!empty($keyword)) {
            $query->where('name', 'like', "%$keyword%");
        }
        $users = $query->paginate(10);
        return view('admin.users.list', ['users' => $users]);
    }
}
