<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Page;
use App\Models\Rating;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Crypt;

class PagesController extends Controller
{
    public function index()
    {
        $pages = Page::all();
        return view('admin.pages.index', compact('pages'));
    }

    public function create()
    {
        return view('admin.pages.create');
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title' => 'required',
            'slug' => 'required|unique:pages',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => false, 'errors' => $validator->errors()]);
        }

        $page = new Page();
        $page->name = $request->title;
        $page->slug = $request->slug;
        $page->content = $request->content;
        $page->save();
        session()->flash('success', 'Page created successfully');
        return response()->json(['status' => true, 'message' => 'Page created successfully']);
    }

    public function edit($id)
    {
        $enc_id = decrypt($id);
        $page = Page::find($enc_id);
        return view('admin.pages.edit', ['page' => $page]);
    }

    public function update(Request $request)
    {
        $page = Page::find($request->id);
        $validator = Validator::make($request->all(), [
            'title' => 'required',
            'slug' => 'required|unique:pages,slug,' . $page->id,
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => false, 'errors' => $validator->errors()]);
        }

        $page->name = $request->title;
        $page->slug = $request->slug;
        $page->content = $request->content;
        $page->update();
        session()->flash('success', 'Page updated successfully');
        return response()->json(['status' => true, 'message' => 'Page updated successfully']);
    }

    public function destroy(Request $request)
    {
        $enc_id = decrypt($request->id);
        $page = Page::find($enc_id);
        $page->delete();
        session()->flash('success', 'Page deleted successfully');
        return response()->json(['status' => true, 'message' => 'Page deleted successfully']);
    }

    public function showRating(Request $request)
    {

        $search = $request->keyword;
        if ($search) {
            $ratings = Rating::with('product')
                ->where('username', 'LIKE', '%' . $search . '%')
                ->orWhereHas('product', function ($query) use ($search) {
                    $query->where('title', 'LIKE', '%' . $search . '%');
                });
        } else {
            $ratings = Rating::with('product');
        }
        $ratings = $ratings->paginate(10);
        return view('admin.ratings.list', ['ratings' => $ratings]);
    }

    public function editStatus($id)
    {
        $decryptId = Crypt::decrypt($id);
        $rating = Rating::find($decryptId);
        $rating->status = $rating->status == 1 ? 0 : 1;
        $rating->update();
        return redirect()->back();
    }
}
