<?php

namespace App\Http\Controllers\API\Volunteer;

use App\Http\Controllers\API\BaseController as BaseController;
use App\Models\Volunteer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;
use Illuminate\Http\JsonResponse;

class AuthController extends BaseController
{
    public function login(Request $request) : JsonResponse
        {
            $request->validate([
                'name' => 'required',
                'password' => 'required',
            ]);

            $volunteer = Volunteer::where('name', $request->name)->first();

            if (!$volunteer || $volunteer->password !== $request->password) {
                return response()->json(['message' => 'Invalid credentials'], 401);
            }

            $token = $volunteer->createToken('volunteerToken')->plainTextToken;

            return response()->json(['token' => $token, 'volunteer' => $volunteer], 200);
        }
}
