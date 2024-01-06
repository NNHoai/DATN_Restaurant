
document.addEventListener("DOMContentLoaded", function (event) {
});


function load_menu() {
    document.getElementById("manage_content").innerHTML = "{% include 'app/login.html' %}";
}
function load_table() {
    document.getElementById("manage_content").innerHTML = '<object type="type/html" data="login.html" ></object>';
}
function load_staff() {
    document.getElementById("manage_content").innerHTML = '<object type="type/html" data="home.html" ></object>';
}
function load_customer() {
    document.getElementById("manage_content").innerHTML = '<object type="type/html" data="home.html" ></object>';
}
function load_day() {
    document.getElementById("manage_content").innerHTML = '<object type="type/html" data="home.html" ></object>';
}
function load_month() {
    document.getElementById("manage_content").innerHTML = '<object type="type/html" data="home.html" ></object>';
}
// menu_manage
var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
    dropdown[i].addEventListener("click", function () {
        this.classList.toggle("active_menu");
        var dropdownContent = this.nextElementSibling;
        if (dropdownContent.style.display === "block") {
            dropdownContent.style.display = "none";
        } else {
            dropdownContent.style.display = "block";
        }
    });
}

$('document').ready(function () {
    $("#id_image").change(function () {
        if (this.files && this.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#imgproduct').attr('src', e.target.result);
            }
            reader.readAsDataURL(this.files[0]);
        }
    });
});
var list_product = document.getElementsByClassName('list_product');

function show_list_product(pk) {
    for (i = 0; i < list_product.length; i++) {
        if (list_product[i].id == pk) {
            list_product[i].style.display = "block";
        }
        else {
            list_product[i].style.display = "none";
        }
    }
    // document.getElementById(pk).getElementsByClassName('list_product').style.display = "block"
}
window.onload = function () {
    show_list_product(1)
};

var list_btn_category = document.getElementsByClassName('btn_category');

for (i = 0; i < list_btn_category.length; i++) {
    list_btn_category[i].addEventListener('click', function () {
        var categoryid = this.id;
        show_list_product(categoryid);
    })
}

// var btn_add_category = document.getElementById('add_category');

// btn_add_category.addEventListener('click', function(){
//     document.location.href ="{% url 'addcategory' %}"
// });

// var btn_add_product = document.getElementById('add_product');

// btn_add_product.addEventListener('click', function(){
//     document.location.href ="{% url 'addproduct' %}"
// });


// var btn_statistic = document.getElementsByClassName("btn-statistic")[0];
// btn_statistic.addEventListener("click",function(){
//   btn = btn_statistic.id
//   if(btn == 'btn_date'){
//     var daystart = document.getElementById('daystart').value;
//     var dayend = document.getElementById('dayend').value;
//     statistics_date(daystart, dayend)
//   }
//   else{
//     var year = document.getElementById('year').value;
//     statistics_year(year)
//   }
// }); 

// function statistics_date(daystart, dayend) {

//     var url = '/statistics_date/'
//     fetch(url, {
//         method: 'POST', 
//         headers: {
//             'Content-Type': 'application/json',
//             'X-CSRFToken': csrftoken
//         },
//         body: JSON.stringify({ 'daystart': daystart, 'dayend': dayend})
//     })
//         .then((response) => {
//             return response.json();
//         })
// };

// function statistics_year(year) {

//     var url = '/statistics_year/'
//     fetch(url, {
//         method: 'POST', 
//         headers: {
//             'Content-Type': 'application/json',
//             'X-CSRFToken': csrftoken
//         },
//         body: JSON.stringify({ 'year': year })
//     })
//         .then((response) => {
//             return response.json();
//         })
// };