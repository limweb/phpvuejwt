<?php
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class BaseMobel extends Model  {

        public static function boot()     {
           parent::boot();
           static::creating(function($model){
               //dump('creating');
           }); 
           static::created(function($model){
               //dump('created');
           }); 
           static::updating(function($model){
               //dump('updating');
           }); 
           static::updated(function($model){
               //dump('updated');
           });
           static::saving(function($model){
               //dump('saving');
           }); 
           static::saved(function($model){
               //dump('saved');
           }); 
           static::loaded(function($model){
               //dump('load');
           }); 
        }
        
        public function newFromBuilder($attributes = array(),$connection = null) {
           $instance = parent::newFromBuilder($attributes);
           $instance->fireModelEvent('loaded');
           return $instance;
        }
        public static function loaded($callback, $priority = 0)    {
           static::registerModelEvent('loaded', $callback, $priority);
        }

        //--- public function in model want start getCapitalname---
        public function getTableColumns() {
            return $this->getConnection()->getSchemaBuilder()->getColumnListing($this->getTable());
        }
}


class Package  extends  BaseMobel  { 
    // use SoftDeletes;
    // protected $dates = ['deleted_at'];    
    protected  $table='packages';
    protected  $primaryKey='id';
}

class User  extends  BaseMobel  { 
    // use SoftDeletes;
    // use LoadTrait;
    // protected $dates = ['deleted_at'];
    protected $table='users';
    protected $primaryKey='id';
    protected $hidden =   ["password"];
    protected $fillable = ['user','password','role_id'];
    // protected $guarded =  ['package'];


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


    public static function boot()     {
        parent::boot();
        static::loaded(function($model){
            // dump('load');
            $model->role;
            $model->profile;
        }); 
    }
}

class Role  extends BaseMobel  {
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

    public function permission(){
        return $this->hasMany('Permission');
    }

}

class permission_role extends BaseMobel {
    protected $table = 'permission_role';
}

class Syspackage extends BaseMobel {
    protected $table = 'sys_packages';
}

class Permission  extends BaseMobel  {
    protected  $table='permissions';
    protected  $primaryKey='id';
    public function module(){
        return $this->belongsTo('Module');
    }
}

class Module  extends BaseMobel  {
    protected  $table='modules';
    protected  $primaryKey='id';

    public function scopePermission($query,$role_id) {
        return Permission::where('role_id',$role_id)->where('module_id',$this->id)->first();
    }
}

class Profile  extends BaseMobel  {
    // use SoftDeletes;
    // protected $dates = ['deleted_at'];
    protected  $table='profiles';
    protected  $primaryKey='id';
}

class Company  extends  BaseMobel  { 
    // use SoftDeletes;
    // protected $dates = ['deleted_at'];
    protected  $table='companies';
    protected  $primaryKey='id';
}
   
class Dbcolinfo extends BaseMobel {
    // use SoftDeletes;
    // protected $dates = ['deleted_at'];
    protected  $table='dbcolumninfos';
    protected  $primaryKey='id';
}     



