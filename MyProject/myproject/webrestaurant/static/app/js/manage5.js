
//add cart
var updatebtns = document.getElementsByClassName('update-cart');

for (i = 0; i < updatebtns.length; i++) {
    updatebtns[i].addEventListener('click', function () {
        var productid = this.dataset.product
        var action = this.dataset.action
        if (user === "AnonymousUser") {
            console.log('Bạn chưa đăng nhập')
        }
        else {
            updateUserOrder(productid, action)
        }
    })
}

function updateUserOrder(productid, action) {
    var url = '/update_item/'
    fetch(url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRFToken': csrftoken
        },
        body: JSON.stringify({ 'productid': productid, 'action': action })
    })
        .then((response) => {
            return response.json()
        })
        .then((data) => {
            console.log('data', data)
            location.reload()
        })
}


function change_image(image) {
    var container = document.getElementById("main-image");
    container.src = image.src;
}

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


// //choose table
// var btnTables = document.getElementsByClassName('table')

// for ( i = 0; i < btnTables.length; i++) {
//     btnTables[i].addEventListener('click', function(){
//         var tableid = this.dataset.product
//         if (user === "AnonymousUser"){
//             console.log('Bạn chưa đăng nhập')
//         }
//         else{
//             chooseTable(tableid)
//         }
//     })
// }

// function chooseTable(tableid){
//     var url = '/choose_table/'
//     fetch(url,{
//         method: 'POST',
//         headers:{
//             'Content-Type': 'application/json',
//             'X-CSRFToken': csrftoken
//         },
//         body: JSON.stringify({'tableid': tableid})
//     })
//     .then((response) => {
//         return response.json()
//     })
//     // .then((data) => {
//     //     console.log('data', data)
//     //     location.reload()
//     // })
// }  

//add bill
var update_bill_btns = document.getElementsByClassName('update_bill')

for (i = 0; i < update_bill_btns.length; i++) {
    update_bill_btns[i].addEventListener('click', function () {
        var billid = this.id
        var productid = this.dataset.product
        var action = this.dataset.action
        if (user === "AnonymousUser") {
            console.log('Bạn chưa đăng nhập')
        }
        else {
            updateProductOrder(billid, productid, action)
        }
    })
}

function updateProductOrder(billid, productid, action) {
    var url = '/update_bill/'
    fetch(url, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
            'X-CSRFToken': csrftoken
        },
        body: JSON.stringify({ 'billid': billid, 'productid': productid, 'action': action })
    })
        .then((response) => {
            return response.json()
        })
        .then((data) => {
            console.log('data', data)
            location.reload()
        })
}

var all_table = document.getElementById('all-table');
var empty_table = document.getElementById('empty-table');
var busy_table = document.getElementById('busy-table');

var btn_all_table = document.getElementById('all_table');
var btn_empty_table = document.getElementById('empty_table');
var btn_busy_table = document.getElementById('busy_table');

btn_all_table.addEventListener('click', function () {
    all_table.style.display = 'block';
    empty_table.style.display = 'none';
    busy_table.style.display = 'none';
});

btn_empty_table.addEventListener('click', function () {
    all_table.style.display = 'none';
    empty_table.style.display = 'block';
    busy_table.style.display = 'none';
});

btn_busy_table.addEventListener('click', function () {
    all_table.style.display = 'none';
    empty_table.style.display = 'none';
    busy_table.style.display = 'block';
});


// Get the modal
var modal = document.getElementById("myModal");

// Get the button that opens the modal
var btn_merge_table = document.getElementById('merge_table');
var btn_change_table = document.getElementById('change_table');

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];
var cancel = document.getElementById("cancel");

// When the user clicks on <span> (x), close the modal
span.onclick = function () {
    modal.style.display = "none";
}

cancel.onclick = function () {
    modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function (event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

var btn_act = document.getElementById('btn_act');

btn_act.addEventListener('click', function () {
    var table1 = this.dataset.table;
    var action = this.dataset.action;
    var table2 ;
    if (action == 'merge'){
        table2 = document.getElementById('table_merge').value;
    }
    else if((action == 'change')){
        table2 = document.getElementById('table_change').value;
    }
        
    if (user === "AnonymousUser") {
        console.log('Bạn chưa đăng nhập')
    }
    else {
        updateTable(table1, table2, action)
    }
})

// When the user clicks the button, open the modal 
btn_merge_table.addEventListener('click', function () {
    var table1 = this.dataset.table;
    var action = this.dataset.action;
    var table2 = document.getElementById('table_merge').value;
    // var check = confirm('Bạn muốn gộp bàn ' + table1 + ' và bàn ' + table2 + '?');
    // if (check) {

    // }
    // var div_btn_bill = document.getElementById('btn_bill');
    // let html =  '<!-- The Modal -->'
    //                         +'<div id="myModal"class="modal">'
    //                         +'<!-- Modal content -->'
    //                         +'<div class="modal-content">'
    //                         +'<div class="modal-header">'
    //                         +'<h2>Thông báo!</h2>'
    //                         +'<span class="close">&times;</span>'
    //                         +'</div>'
    //                         +'<div class="modal-body">'
    //                         +'<p>Bạn muốn gộp bàn '+ table1 +' và bàn '+ table2 +' ?</p>'
    //                         +'</div>'
    //                         +'<div class="modal-footer">'
    //                         +'<button class="btn_act" id="merge">Gộp bàn</button>'
    //                         +'<button class="cancel" id="cancel">Hủy</button>'
    //                         +'</div>'
    //                         +'</div>'
    //                         +'</div>';
    // div_btn_bill.insertAdjacentHTML("afterend", html);

    // // Get the modal
    // var modal = document.getElementById("myModal");

    // modal.style.display = "block";

    // // Get the <span> element that closes the modal
    // var span = document.getElementsByClassName("close")[0];
    // var cancel = document.getElementById("cancel");

    // // When the user clicks on <span> (x), close the modal
    // span.addEventListener('click', function () {
    // modal.style.display = "none";
    // });

    // cancel.addEventListener('click', function () {
    // modal.style.display = "none";
    // });

    // // When the user clicks anywhere outside of the modal, close it
    // window.onclick = function(event) {
    // if (event.target == modal) {
    //     modal.style.display = "none";
    // }
    // }

    var div_model_body = document.getElementById('modal-body');
    div_model_body.innerHTML = "";

    const element = document.createElement("p");
    element.innerText = 'Bạn muốn gộp bàn ' + table1 + ' và bàn ' + table2 + ' ?';

    div_model_body.append(element);

    modal.style.display = "block";

    btn_act.dataset.action = "merge";

    // btn_act.removeEventListener('click', changeTable);
    // btn_act.addEventListener('click', mergeTable);

    // var oldaction = 'change'
    // btn_act.removeEventListener('click', updateTable(table1, table2, oldaction));
    // btn_act.addEventListener('click', updateTable(table1, table2, action));
});

btn_change_table.addEventListener('click', function () {
    var table1 = this.dataset.table;
    var action = this.dataset.action;
    var table2 = document.getElementById('table_change').value;

    var div_model_body = document.getElementById('modal-body');

    div_model_body.innerHTML = "";

    const element = document.createElement("p");
    element.innerText = 'Bạn muốn chuyển bàn ' + table1 + ' sang bàn ' + table2 + ' ?';

    div_model_body.append(element);

    // let html =  'Bạn muốn chuyển bàn ' + table1 + ' sang bàn ' + table2 + ' ?';
    // div_model_body.insertAdjacentHTML("afterend", html);

    modal.style.display = "block";

    btn_act.dataset.action = "change";

    // btn_act.removeEventListener('click', mergeTable);
    // btn_act.addEventListener('click', changeTable);
    
    // var oldaction = 'merge'
    // btn_act.removeEventListener('click', updateTable(table1, table2, oldaction));
    // btn_act.addEventListener('click', updateTable(table1, table2, action));
});

// var update_table_btns = document.getElementsByClassName('update_table')

// for (i = 0; i < update_table_btns.length; i++) {
//     update_table_btns[i].addEventListener('click', function () {
//         var table1 = this.dataset.table;
//         var action = this.dataset.action;
//         var table2 ;
//         if (action == 'merge'){
//             table2 = document.getElementById('table_merge').value;
//         }
//         else if((action == 'change')){
//             table2 = document.getElementById('table_change').value;
//         }
            
//         if (user === "AnonymousUser") {
//             console.log('Bạn chưa đăng nhập')
//         }
//         else {
//             updateTable(table1, table2, action)
//         }
//     })
// };

function updateTable(table1, table2, action) {

    var url = '/update_table/'
    fetch(url, {
        method: 'POST', 
        headers: {
            'Content-Type': 'application/json',
            'X-CSRFToken': csrftoken
        },
        body: JSON.stringify({ 'table1': table1, 'table2': table2, 'action': action })
    })
        .then((response) => {
            return response.json()
        })
        .then((data) => {
            console.log('data', data)
            location.reload()
        })
};




