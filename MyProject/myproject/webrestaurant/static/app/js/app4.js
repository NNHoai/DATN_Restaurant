var updatebtns = document.getElementsByClassName('update-cart')

for ( i = 0; i < updatebtns.length; i++) {
    updatebtns[i].addEventListener('click', function(){
        var productid = this.dataset.product
        var action = this.dataset.action
        if (user === "AnonymousUser"){
            console.log('Bạn chưa đăng nhập')
        }
        else{
            updateUserOrder(productid, action)
        }
    })
}

function updateUserOrder(productid, action){
    var url = '/update_item/'
    fetch(url,{
        method: 'POST',
        headers:{
            'Content-Type': 'application/json',
            'X-CSRFToken': csrftoken
        },
        body: JSON.stringify({'productid':productid,'action':action})
    })
    .then((response) => {
        return response.json()
    })
    .then((data) => {
        console.log('data', data)
        location.reload()
    })
}
function change_image(image){
    var container = document.getElementById("main-image");
    container.src = image.src;
}
document.addEventListener("DOMContentLoaded", function(event) {
});
function load_menu(){
    document.getElementById("manage_content").innerHTML="{% include 'app/login.html' %}";
}
function load_table(){
    document.getElementById("manage_content").innerHTML='<object type="type/html" data="login.html" ></object>';
}
function load_staff(){
    document.getElementById("manage_content").innerHTML='<object type="type/html" data="home.html" ></object>';
}
function load_customer(){
    document.getElementById("manage_content").innerHTML='<object type="type/html" data="home.html" ></object>';
}
function load_day(){
    document.getElementById("manage_content").innerHTML='<object type="type/html" data="home.html" ></object>';
}
function load_month(){
    document.getElementById("manage_content").innerHTML='<object type="type/html" data="home.html" ></object>';
}
// menu_manage
var dropdown = document.getElementsByClassName("dropdown-btn");
var i;

for (i = 0; i < dropdown.length; i++) {
  dropdown[i].addEventListener("click", function() {
    this.classList.toggle("active_menu");
    var dropdownContent = this.nextElementSibling;
    if (dropdownContent.style.display === "block") {
      dropdownContent.style.display = "none";
    } else {
      dropdownContent.style.display = "block";
    }
  });
}

  