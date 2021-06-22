<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.css">

<div class="row " style="margin-left: 11px;margin-right: 11px;">
  <div class="col-lg-3 col-xs-6">
    <!-- small box -->
    <div class="small-box bg-gray">
        <a class="btn bg-primary" href="{{ url('admin/orders') }}">

        <div class="inner">
        <h3>{{$customers}}</h3>

        <p>Total Customers</p>
      </div>
        </a>

        <div class="icon">
        <i class="fa fa-user"></i>
      </div>
    </div>
  </div>
  <!-- ./col -->
  <div class="col-lg-3 col-xs-6">
    <!-- small box -->
    <div class="small-box bg-olive">
        <a class="btn bg-primary" href="{{ url('admin/orders?_sort%5Bcolumn%5D=id&_sort%5Btype%5D=desc') }}">
      <div class="inner">
        <h3>{{$total_orders}}
        <!--<sup style="font-size: 20px">%</sup> !-->
        </h3>

        <p>Total Orders</p>
      </div>
        </a>
      <div class="icon">
        <i class="fa fa-bar-chart"></i>
      </div>
    </div>
  </div>
  <!-- ./col -->
  <div class="col-lg-3 col-xs-6">
    <!-- small box -->
    <div class="small-box bg-maroon">
        <a class="btn bg-primary" href="{{ url('admin/orders?_sort%5Bcolumn%5D=id&_sort%5Btype%5D=desc&id=&customer_id=&delivered_by=&order_id=&customer_id=&status=7&expected_pickup_date=&expected_delivery_date=') }}">
      <div class="inner">
        <h3>{{$completed_orders}}</h3>

        <p>Completed Orders</p>
      </div>
        </a>
      <div class="icon">
        <i class="fa fa-bookmark"></i>
      </div>
    </div>
  </div>
    <div class="col-lg-3 col-xs-6">
    <!-- small box -->
    <div class="small-box bg-primary">
        <a class="btn btn-primary" href="{{ url('admin/payment-histories?_sort%5Bcolumn%5D=id&_sort%5Btype%5D=desc') }}">
            <div class="inner">
                <h3>{{$earnings}} Inr</h3>

                <p>Total Earnings</p>
            </div>
        </a>

        <div class="icon">
                <i class="fa fa-money"></i>
            </div>
    </div>
  </div>
  <!-- ./col -->
  <div class="col-lg-3 col-xs-6">
    <!-- small box -->
    <div class="small-box bg-purple">
        <a class="btn btn-primary" href="{{ url('admin/delivery_boys') }}">
      <div class="inner">
        <h3>{{$delivery_boys}}</h3>

        <p>Total Delivery Boys</p>
      </div>
        </a>
      <div class="icon">
        <i class="fa fa-motorcycle"></i>
      </div>
    </div>
  </div>
    <div class="col-lg-3 col-xs-6">
    <!-- small box -->
    <div class="small-box bg-yellow-gradient">
        <a class="btn btn-primary" href="{{ url('admin/leads') }}">
      <div class="inner">
        <h3>{{$leads}}</h3>

        <p>Total Leads</p>
      </div>
        </a>
      <div class="icon">
        <i class="fa fa-user-plus"></i>
      </div>
    </div>
  </div>
  <!-- ./col -->
</div>
<div class="col-lg-6">
  <canvas id="orders" width="400"></canvas>
</div>
<div class="col-lg-6">
  <canvas id="customers" width="400"></canvas>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>

<script>
var ctx_orders = document.getElementById('orders').getContext('2d');
var orders = new Chart(ctx_orders, {
    type: 'bar',
    data: {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        datasets: [{
            label: '# of Orders',
            data: [{{ $orders_chart }}],
            backgroundColor: [
                'rgba(54, 162, 235, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(54, 162, 235, 0.2)'
            ],
            borderColor: [
                'rgba(54, 162, 235, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(54, 162, 235, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true,
                    callback: function(value) {if (value % 1 === 0) {return value;}}
                }
            }]
        }
    }
});

var ctx_customers = document.getElementById('customers').getContext('2d');
var customers = new Chart(ctx_customers, {
    type: 'line',
    data: {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
        datasets: [{
            label: '# of Customers',
            data: [{{ $customers_chart }}],
            backgroundColor: [
                'rgba(153, 102, 255, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(153, 102, 255, 0.2)'
            ],
            borderColor: [
                'rgba(153, 102, 255, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(153, 102, 255, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true,
                    callback: function(value) {if (value % 1 === 0) {return value;}}
                }
            }]
        }
    }
});
</script>
