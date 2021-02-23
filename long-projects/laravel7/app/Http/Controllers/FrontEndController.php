<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class FrontEndController extends Controller
{
    // frontend
    public function About() {
        return view('pages.about-us');
    }
}
