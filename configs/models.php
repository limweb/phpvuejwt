<?php
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class Package  extends  Model  { 
    // use SoftDeletes;
    // protected $dates = ['deleted_at'];    
    protected  $table='packages';
    protected  $primaryKey='id';
}

class User  extends  Model  { 
    // use SoftDeletes;
    // use LoadTrait;
    // protected $dates = ['deleted_at'];
    protected $table='users';
    protected $primaryKey='id';
    protected $hidden =   ["password"];
    protected $fillable = ['user','password','role_id'];
    // protected $guarded =  ['package'];

    public function aaaa(){
        return  'aaaa';
    }

    public function __construct(array $attributes = []) {
        //$this->setRawAttributes(['expire_date' => Carbon::now()->addDays(7)],true);
        parent::__construct($attributes);
    }

    public function role() {
        return $this->belongsTo('Role','role_id','id');
    }


    public function company() {
        if($this->uuid == -1 ){
            return $this->hasOne('Company','id','default_select_comp');
        } else {
            return $this->hasOne('Company','id','default_select_comp')->where('comp_code',$this->uuid);
        }
    }

    public function companies(){
        return $this->hasMany('Company','comp_code','uuid')->where('status',1)->whereNull('deleted_at')->orderBy('sort','asc');
    }

    public function roles(){
        return $this->hasMany('Role','comp_code','uuid')->orWhere('comp_code','*********');
    }

    public function compmodules(){
        return $this->hasMany('Compmodule','comp_code','uuid');
    }

    public function profile() {
        return $this->hasOne('Profile');
    }
    
    public function scopeIsSysadmin($query){
        return $query->where('sysadmin',1);
    }

    public function scopeIsParent($query){
        return $query->where('parent_id',0);
    }

    //--- public function in model want start getCapitalname---
    public function getTableColumns() {
        return $this->getConnection()->getSchemaBuilder()->getColumnListing($this->getTable());
    }

}

class Role  extends Model  {
    // use SoftDeletes;
    // protected $dates = ['deleted_at'];
    protected  $table='roles';
    protected  $primaryKey='id';

    public function parent()  {
        return $this->hasOne('Role', 'id', 'parent_id');
    }

    public function children() {
        return $this->hasMany('Role', 'parent_id', 'id');
    }

    public function permissions(){
        return $this->belongsToMany('Permission');
    }

        //--- public function in model want start getCapitalname---
    public function getTableColumns() {
        return $this->getConnection()->getSchemaBuilder()->getColumnListing($this->getTable());
    }
}

class permission_role extends Model {
    protected $table = 'permission_role';
}

class Syspackage extends Model {
    protected $table = 'sys_packages';
}

class Permission  extends Model  {
    protected  $table='permissions';
    protected  $primaryKey='id';
    public function module(){
        return $this->belongsTo('Module');
    }
    //--- public function in model want start getCapitalname---
    public function getTableColumns() {
        return $this->getConnection()->getSchemaBuilder()->getColumnListing($this->getTable());
    }    
}

class Module  extends Model  {
    protected  $table='modules';
    protected  $primaryKey='id';
    //--- public function in model want start getCapitalname---
    public function getTableColumns() {
        return $this->getConnection()->getSchemaBuilder()->getColumnListing($this->getTable());
    }    
}

class Profile  extends Model  {
    // use SoftDeletes;
    // protected $dates = ['deleted_at'];
    protected  $table='profiles';
    protected  $primaryKey='id';
    //--- public function in model want start getCapitalname---
    public function getTableColumns() {
        return $this->getConnection()->getSchemaBuilder()->getColumnListing($this->getTable());
    }
}

class Company  extends  Model  { 
    // use SoftDeletes;
    // protected $dates = ['deleted_at'];
    protected  $table='companies';
    protected  $primaryKey='id';
    //--- public function in model want start getCapitalname---
    public function getTableColumns() {
        return $this->getConnection()->getSchemaBuilder()->getColumnListing($this->getTable());
    }
}
   
class Dbcolinfo extends Model {
    // use SoftDeletes;
    // protected $dates = ['deleted_at'];
    protected  $table='dbcolumninfos';
    protected  $primaryKey='id';
    //--- public function in model want start getCapitalname---
    public function getTableColumns() {
        return $this->getConnection()->getSchemaBuilder()->getColumnListing($this->getTable());
    }    
}     



