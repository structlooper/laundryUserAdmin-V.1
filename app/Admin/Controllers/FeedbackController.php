<?php

namespace App\Admin\Controllers;

use App\Customer;
use App\Feedback;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class FeedbackController extends AdminController
{

    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Feedback';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Feedback());
        $grid->column('user_id', __('Customer'))->display(function($user_id){
            return  Customer::where('id',$user_id)->value('customer_name');
        });
        $grid->column('message', __('Message'));
        $grid->column('created_at', __('Sent at'));

        $grid->disableExport();
        $grid->disableCreateButton();
        $grid->disableActions();
        $grid->actions(function ($actions) {
            $actions->disableEdit();
            $actions->disableDelete();
        });
        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(Feedback::findOrFail($id));
        $show->field('id', __('Id'));


        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new Feedback());

        $form->textarea('message', __('Message'));

        return $form;
    }
}
