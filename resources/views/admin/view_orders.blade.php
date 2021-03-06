<div class="container">
     <div class="col-md-2 col-md-offset-10">
        <a href='{{ url('/admin/orders?&_sort%5Bcolumn%5D=id&_sort%5Btype%5D=desc') }}' class='btn btn-info pull-right' style='margin-right:20px;'>Back</a>
    </div>
    <div class="col-lg-6">
        <div class="table-responsive">
          <table class="table">
            <tbody>
              <tr>
                <th>Order Id</th>
                <td>{{$order_id}}</td>
              </tr>
              <tr>
                <th>Customer Name</th>
                <td>{{$customer_name}}</td>
              </tr>
              <tr>
                <th>Services</th>
                <td>{{$selected_services}}</td>
              </tr>
              <tr>
                <th>Estimated cloths</th>
                <td>{{$estimated_cloths}}</td>
              </tr>
              <tr>
                <th>Additional items</th>
                <td>{{($additional_item_ids !== null)?str_replace(',',', ',$additional_item_ids):'No additional item'}}</td>
              </tr>
              <tr>
                <th>Door number/Landmark</th>
                <td>{{$door_no}}</td>
              </tr>
              <tr>
                <th>Address</th>
                <td>{{$address}}</td>
              </tr>
              <tr>
                <th>Pickup Date</th>
                <td>{{$expected_pickup_date}}  ({{ $pickup_time }})</td>
              </tr>
              <tr>
                  <th>Expected Delivery Date</th>
                  <td>{{$expected_delivery_date}} ({{ $drop_time }})</td>
              </tr>
            </tbody>
          </table>
        </div>
    </div>
    <div class="col-lg-6">
        <div class="table-responsive">
          <table class="table">
            <tbody>
              <tr>
                <th>Delivered By</th>
                <td>{{$delivered_by}}</td>
              </tr>
              <tr>
                <th>Payment Mode</th>
                <td>{{$payment_mode}}</td>
              </tr>
              <tr>
                <th>Payment Status</th>
                <td>{{$payment_status}}</td>
              </tr>
              <tr>
                <th>Sub Total</th>
                <td>{{$sub_total}}</td>
              </tr>
              <tr>
                <th>Discount</th>
                <td>{{$discount}}</td>
              </tr>
              <tr>
                <th>Membership Discount</th>
                <td>{{$mem_discount}}</td>
              </tr>
              <tr>
                <th>Delivery Charges</th>
                <td>{{$delivery_changes}}</td>
              </tr>
              <tr>
                <th>Delivery discount</th>
                <td>{{$delivery_changes_discount}}</td>
              </tr>
              <tr>
                <th>Total</th>
                <td>{{$total}}</td>
              </tr>
              <tr>
                <th>Status</th>
                <td>{{$status}}</td>
              </tr>
              @if($status === 'Canceled')
              <tr>
                <th>Cancel reason</th>
                <td>{{$cance_reason}}</td>
              </tr>
              @endif
            </tbody>
          </table>
        </div>
    </div>
    <div class="col-lg-12">
        <h3>Items</h3>
        <table class="table table-hover">
            <thead>
              <tr>
                <th>Service</th>
                <th>Product</th>
                <th>Qty</th>
              </tr>
            </thead>
            <tbody>
            @foreach($order_items as $value)
              <tr>
                <td>{{ $value->service_name }}</td>
                <td>{{ $value->product_name }}</td>
                <td>{{ $value->qty }}</td>
              </tr>
            @endforeach
            </tbody>
        </table>
    </div>
</div>
