<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use App\Http\Requests\Front\ContactRequest;
use App\Models\Contact;
use Illuminate\Support\Facades\Mail;

class ContactController extends Controller
{
    public function create()
    {
        return view('front.contact');
    }

    public function store(ContactRequest $request)
    {
        if($request->user()) {
            $request->merge([
                'user_id' => $request->user()->id,
                'name'    => $request->user()->name,
                'email'   => $request->user()->email,
            ]);
            $mail_data = [
                'recipient' => 'softcode.gersogni@gmail.com',
                'fromEmail' => $request->user()->email,
                'fromName' => $request->user()->name,
                'subject' => 'Message envoyé depuis softcode',
                'body' => $request->message,
            ];
        }else {
            $mail_data = [
                'recipient' => 'softcode.gersogni@gmail.com',
                'fromEmail' => $request->email,
                'fromName' => $request->name,
                'subject' => 'Message envoyé depuis softcode',
                'body' => $request->message,
            ];
        }

        

        Mail::send('email_template', $mail_data, function ($message) use($mail_data){
            $message->to($mail_data['recipient'])
                    ->from($mail_data['fromEmail'], $mail_data['fromName'])
                    ->subject($mail_data['subject']);
        }); 

        Contact::create ($request->all());

        return back()->with ('status', __('Your message has been recorded, we will respond as soon as possible.'));

        
    }
}