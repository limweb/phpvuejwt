<?php
use \Jacwright\RestServer\RestException;
use Illuminate\Database\Capsule\Manager as Capsule; 
use \Jacwright\RestServer\RestController as BaseController;

class QuestionController extends BaseController {


    public function getJson($id = null,$a=null,$b=null,$c=null) {
        $o = new stdClass();
        $groups = Group::get();
        foreach ($groups as $group) {
            foreach($group->categories as $category){
                if($category->diffs->count() > 0 ){
                    foreach($category->diffs as $diff ) {
                        $diff->questions = Question::where('group_id',$diff->group_id)->where('diff',$diff->diff)->where('category_id',$diff->category_id)->get();
                        foreach ($diff->questions as $question) {
                            $question->choices;
                        }                    
                    }
                } else {
                    $category->questions = Question::where('group_id',$group->id)->where('diff',1)->where('category_id',$category->cat_id)->get();
                    foreach ($category->questions as $question) {
                            $question->choices;
                    }
                }
            }
        }

        $o->groups = $groups;
        return $o;
    }



    /**
     * Returns a JSON string object to the browser when hitting the root of the domain
     *
     * @url POST /
     * @url GET /
     * @noAuth
     */
    public function questions()
    {
        $o = new stdClass();
        $groups = Group::get();
        foreach ($groups as $group) {
            foreach($group->categories as $category){
                if($category->diffs->count() > 0 ){
                    foreach($category->diffs as $diff ) {
                        $diff->questions = Question::where('group_id',$diff->group_id)->where('diff',$diff->diff)->where('category_id',$diff->category_id)->get();
                        foreach ($diff->questions as $question) {
                            $question->choices;
                        }                    
                    }
                } else {
                    $category->questions = Question::where('group_id',$group->id)->where('diff',1)->where('category_id',$category->cat_id)->get();
                    foreach ($category->questions as $question) {
                            $question->choices;
                    }
                }
            }
        }

        $o->groups = $groups;
        return base64_encode(json_encode($o));
    }



}