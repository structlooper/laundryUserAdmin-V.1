<?php

namespace App\Admin\Controllers;

use App\PaymentHistory;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class PaymentHistoryController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'PaymentHistory';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new PaymentHistory());
        $payment = PaymentHistory::all();
        $total_earn=0;
        foreach ($payment as $item){
            $total_earn += $item->amount;
        }
        $grid->column('id', __('Id'))->sortable();
        $grid->column('amount', __('Amount ('.$total_earn.')'))->sortable();
        $grid->column('statement', __('Statement'));
        $grid->column('order_id', __('Order id'));
        $grid->column('created_at', __('Paid at'))->sortable();
//        $grid->column('updated_at', __('Updated at'));
        $grid->disableActions();
        $grid->disableCreateButton();
        $grid->disableExport();
        $grid->disableBatchActions();
        $grid->filter(function ($filter) {
            //Get All status
            $filter->date('created_at', 'Paid at');
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
        $show = new Show(PaymentHistory::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('amount', __('Amount'));
        $show->field('statement', __('Statement'));
        $show->field('order_id', __('Order id'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new PaymentHistory());

        $form->decimal('amount', __('Amount'));
        $form->text('statement', __('Statement'));
        $form->text('order_id', __('Order id'));

        return $form;
    }
}
