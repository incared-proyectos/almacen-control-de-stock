<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use App\Models\User;
use Auth;
class PerfilController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return User::find(auth()->id());
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $all = $request->all();
        $validator = Validator::make($request->all(),[
            'name' => 'required',
            'email' => 'required',
        ]);

        if ($validator->fails()) {
           return response()->json(['error'=>$validator->errors()->all()],422);
        }else{
            $id = Auth()->id();
            $user = User::find($id);
            if ($request->hasFile('file')) {
                $img_src = $user->img_src;
                if(!Storage::disk('public_uploads')->has('profile')){
                    Storage::disk('public_uploads')->makeDirectory('profile');
                    if (!Storage::disk('public_uploads')->has('profile/'.$id)) {
                        Storage::disk('public_uploads')->makeDirectory('profile/'.$id);
                    }
                }
                $exists = Storage::disk('public_uploads')->exists('profile/'.$id.'/'.$img_src);
                if ($exists) {
                    Storage::disk('public_uploads')->delete('profile/'.$id.'/'.$img_src);
                }
               
                $files = $request->file('file');
                $extension = $files->getClientOriginalExtension();
                $allowedfileExtension=['jpg','png','jpeg','gif'];
                $check=in_array($extension,$allowedfileExtension);
                if ($check) {
                    $name = $files->store('profile/'.$id,['disk' => 'public_uploads']);
                    $nom_img = explode('/',$name);
                    $all['img_src'] = $nom_img[2];
                }
            }
            $all['password'] = (!empty($all['password'])) ? Hash::make($all['password']) : $user->password;
            $user->fill($all)->save();
            return response()->json(['success'=>'Usuario actualizado con exito']);

        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
