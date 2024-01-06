
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

