<section class="content">


    <div class="row"><div class="col-md-12"><div class="box grid-box">

                <div class="box-header with-border">


                </div>




                <!-- /.box-header -->
                <div class="box-body table-responsive no-padding">
                    <table class="table table-hover grid-table" id="grid-table60d1659f2bb08">
                        <thead>
                        <tr>
                            <th class="column-id">ID</th>
                            <th class="column-customer_name">Customer name</th>
                            <th class="column-phone_number">Phone number</th>
                            <th class="column-email">Email</th>
                            <th class="column-email">Area pin-code</th>

                        </tr>
                        </thead>


                        <tbody>


                            @if(sizeof($leads) > 0)
                            @foreach($leads as $key => $lead)
                                <tr>

                                <td class="column-id">
                                        {{ $lead->id }}
                                    </td>
                                    <td class="column-customer_name">
                                        {{ $lead->customer_name }}
                                    </td>
                                    <td class="column-phone_number">
                                        {{ $lead->phone_number }}
                                    </td>
                                    <td class="column-email">
                                       {{ $lead->email }}
                                    </td>
                                    <td class="column-default_address">
                                        {{ $lead->default_address??'---' }}
                                    </td>
                                </tr>
                            @endforeach
                            @else
                        <tr>

                        <td class="column-id">
                                    No Leads found...
                                </td>
                        </tr>

                        @endif

                        </tbody>



                    </table>

                </div>



{{--                <div class="box-footer clearfix">--}}
{{--                    Showing <b>1</b> to <b>14</b> of <b>14</b> entries<ul class="pagination pagination-sm no-margin pull-right">--}}
{{--                        <!-- Previous Page Link -->--}}
{{--                        <li class="page-item disabled"><span class="page-link">«</span></li>--}}

{{--                        <!-- Pagination Elements -->--}}
{{--                        <!-- "Three Dots" Separator -->--}}

{{--                        <!-- Array Of Links -->--}}
{{--                        <li class="page-item active"><span class="page-link">1</span></li>--}}

{{--                        <!-- Next Page Link -->--}}
{{--                        <li class="page-item disabled"><span class="page-link">»</span></li>--}}
{{--                    </ul>--}}

{{--                    <label class="control-label pull-right" style="margin-right: 10px; font-weight: 100;">--}}

{{--                        <small>Show</small>&nbsp;--}}
{{--                        <select class="input-sm grid-per-pager" name="per-page">--}}
{{--                            <option value="http://covidvaccination.co.in/admin/orders?per_page=10">10</option>--}}
{{--                            <option value="http://covidvaccination.co.in/admin/orders?per_page=20" selected="">20</option>--}}
{{--                            <option value="http://covidvaccination.co.in/admin/orders?per_page=30">30</option>--}}
{{--                            <option value="http://covidvaccination.co.in/admin/orders?per_page=50">50</option>--}}
{{--                            <option value="http://covidvaccination.co.in/admin/orders?per_page=100">100</option>--}}
{{--                        </select>--}}
{{--                        &nbsp;<small>entries</small>--}}
{{--                    </label>--}}

{{--                </div>--}}
{{--                <!-- /.box-body -->--}}
{{--            </div>--}}
        </div>
        </div>
    </div>

</section>
