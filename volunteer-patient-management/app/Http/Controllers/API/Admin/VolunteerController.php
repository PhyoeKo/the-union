<?php

namespace App\Http\Controllers\API\Admin;

use Illuminate\Http\Request;
use App\Http\Controllers\API\BaseController as BaseController;
use Illuminate\Http\JsonResponse;
use App\Http\Resources\VolunteerResource;
use App\Models\Volunteer;
use Validator;

class VolunteerController extends BaseController
{
    public function index(): JsonResponse
    {
        $volunteer = Volunteer::all();
    
        return $this->sendResponse(VolunteerResource::collection($volunteer), 'Volunteer retrieved successfully.');
    }

    public function store(Request $request): JsonResponse
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        $volunteer = Volunteer::create([
            'name' => $request->name
        ]);
        $success['name'] =  $volunteer->name;
        $success['code'] =  $volunteer->code;
        $success['password'] =  $volunteer->password;

   
        return $this->sendResponse($success, 'Volunteer create successfully.');
    } 
}
