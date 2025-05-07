<?php

namespace App\Http\Controllers\admin;

use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use App\Models\orderModel;
use App\Models\Product;
use Illuminate\Http\Request;
use App\Models\User;
use Carbon\Carbon;

class homeController extends Controller
{
    public function index()
    {
        $orders = orderModel::where('delivery_status', '!=', 'pending')->count();
        $customers = User::where('role', 1)->count();
        $products = Product::count();
        $total = orderModel::where('delivery_status', '!=', 'pending')->sum('grandTotal');
        $startDate = Carbon::now()->startOfMonth();
        $currentDate = Carbon::now();
        $revenueThisMonth = orderModel::where('delivery_status', '!=', 'pending')
            ->whereDate('created_at', '>=', $startDate)
            ->whereDate('created_at', '<=', $currentDate)
            ->sum('grandTotal');
        $revenueLastMonth = orderModel::where('delivery_status', '!=', 'pending')
            ->whereDate('created_at', '<', $startDate)
            ->whereDate('created_at', '>=', $currentDate->copy()->subMonth()->startOfMonth())
            ->whereDate('created_at', '<=', $currentDate->copy()->subMonth()->endOfMonth())
            ->sum('grandTotal');
        $thirtyDaysAgo = Carbon::now()->subDays(30);
        $revenueLast30Days = orderModel::where('delivery_status', '!=', 'pending')
            ->whereDate('created_at', '>=', $thirtyDaysAgo)
            ->whereDate('created_at', '<=', $currentDate)
            ->sum('grandTotal');

        return view('admin.dashboard', [
            'orders' => $orders,
            'customers' => $customers,
            'products' => $products,
            'total' => $total,
            'revenueThisMonth' => $revenueThisMonth,
            'revenueLastMonth' => $revenueLastMonth,
            'revenueLast30Days' => $revenueLast30Days
        ]);
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
