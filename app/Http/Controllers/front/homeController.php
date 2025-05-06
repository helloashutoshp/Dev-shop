<?php

namespace App\Http\Controllers\front;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\Page;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\Contact;
use Illuminate\Support\Facades\Mail;
use App\Mail\ContactFormMail;
use App\Mail\ContactFormThankYouMail;
use App\Mail\UserMail;

class homeController extends Controller
{
    public function index()
    {
        $feature_product = Product::where('isfeature', 'Yes')->where('status', 1)->get();
        $latest_product = Product::orderby('id', 'DESC')->with('product_img')->where('status', 1)->take(8)->get();
        return view('front.home', ['feature_product' => $feature_product, 'latest_product' => $latest_product]);
    }

    public function page($slug)
    {
        $page = Page::where('slug', $slug)->first();
        if ($page) {
            return view('front.page', ['page' => $page]);
        } else {
            abort(404);
        }
    }

    public function contactus(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'email' => 'required|email',
            'subject' => 'required',
        ]);
        if ($validator->fails()) {
            return response()->json(['status' => false, 'errors' => $validator->errors()]);
        }
        $contact = new Contact();
        $contact->name = $request->name;
        $contact->email = $request->email;
        $contact->subject = $request->subject;
        $contact->message = $request->message;
        $contact->save();
        Mail::to('ashupra73@gmail.com')->send(new ContactFormMail($contact));
        Mail::to($request->email)->send(new UserMail($contact));
        session()->flash('success', 'Contact us message sent successfully');
        return response()->json(['status' => true, 'message' => 'Contact us message sent successfully']);
    }
}
