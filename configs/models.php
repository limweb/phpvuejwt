<?php
use Illuminate\Database\Eloquent\Model;

class User  extends  Model  { 
    protected  $table='users';
    protected  $primaryKey='id';
    public $timestamps = false;
    protected $hidden = ["password"];
    protected $fillable = ['user','password','role_id'];
    public function role() {
        return $this->belongsTo('Role');
    }

}

class Role  extends Model  {
    protected  $table='roles';
    protected  $primaryKey='id';
    public $timestamps = false;

    public function parent()  {
        return $this->hasOne('Role', 'id', 'parent_id');
    }

    public function children() {
        return $this->hasMany('Role', 'parent_id', 'id');
    }

    public function permissions(){
        return $this->belongsToMany('Permission');
    }

}

class permission_role extends Model {
    protected $table = 'permission_role';

}


class Permission  extends Model  {
    protected  $table='permissions';
    protected  $primaryKey='id';
    public $timestamps = false;

    public function module(){
        return $this->belongsTo('Module');
    }

}

class Module  extends Model  {
    protected  $table='modules';
    protected  $primaryKey='id';
    public $timestamps = false;
}




        
        