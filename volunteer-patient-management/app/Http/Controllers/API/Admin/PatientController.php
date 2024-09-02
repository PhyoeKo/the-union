<?php

namespace App\Http\Controllers\API\Admin;

use App\Http\Controllers\API\BaseController as BaseController;
use App\Http\Resources\PatientResource;
use Illuminate\Http\JsonResponse;
use App\Models\Patient;
use Illuminate\Http\Request;

class PatientController extends BaseController
{
    public function index() : JsonResponse
    {
        $patients =  Patient::with('volunteer')->get();
        return $this->sendResponse(PatientResource::collection($patients), 'Patients retrieved successfully.');
    }

    public function store(Request $request) : JsonResponse
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'volunteer_id' => 'required|exists:volunteers,id',
        ]);

        $patient = Patient::create([
            'name' => $request->name,
            'volunteer_id' => $request->volunteer_id,
        ]);

        return $this->sendResponse(new PatientResource($patient), 'Patient created successfully.');
    }
}
