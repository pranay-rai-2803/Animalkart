function add_to_cart(aId,aSpecies,aPrice){
    let cart = localStorage.getItem("cart");
    if(cart==null){
        // no cart yet
        let animals = [];
        let animal = {animalId : aId , animalName : aSpecies, animalQuantity: 1 , animalPrice : aPrice};
        animals.push(animal);
        localStorage.setItem("cart",JSON.stringify(animals));
//        console.log("Animal is added for the first time");
        showToast(aSpecies+" is added to cart");
    }else{
        // cart is present
        let aCart = JSON.parse(cart);
        let existingAnimal = aCart.find((item)=>item.animalId==aId);
        console.log(existingAnimal);
        if(existingAnimal){
            // we have to increase the quantity
            existingAnimal.animalQuantity=existingAnimal.animalQuantity+1
            aCart.map((item)=>{
                if(item.animalId==existingAnimal.animalId){
                    item.animalQuantity = existingAnimal.animalQuantity;
                }
            })
            localStorage.setItem("cart",JSON.stringify(aCart));
//            console.log("Animal quantity is increased");
            showToast(existingAnimal.animalName + " quantity is increased. Quantiy - " + existingAnimal.animalQuantity);
        }else{
            // we have to add the animal
            let animal = {animalId : aId , animalName : aSpecies, animalQuantity: 1 , animalPrice : aPrice};
            aCart.push(animal);
            localStorage.setItem("cart",JSON.stringify(aCart));
//           console.log("Animal  is added");
          showToast(aSpecies+" is added to cart");
      
        }
    }
    updateCart();
    
}

// update cart

function updateCart(){
    
    let cartString = localStorage.getItem("cart");
    let cart=JSON.parse((cartString));
    if(cart==null || cart.length==0){
        console.log("cart is empty");
        $(".cart-items").html("(0)");
        $(".cart-body").html("<h3>Cart does not have any items</h3>");
        $(".checkout-btn").attr('disabled',true);
    }else{
        // there is something in th cart to show
        console.log(cart);
        $(".cart-items").html(`(${cart.length})`);
        let table =`
            <table class='table'>
            <thead class='thead-light'>
                <tr>
                <th>Item Name </th>
                <th>Price </th>
                <th>Quantity </th>
                <th>Total Price </th>
                <th>Action</th>



            </tr>
            </thead>

                    `;
        let totalPrice = 0; 
        cart.map((item)=>{
            table+=`
                <tr>
                    <td>${item.animalName}</td>
                    <td>${item.animalPrice}</td>
                    <td>${item.animalQuantity}</td>
                    <td>${item.animalQuantity * item.animalPrice}</td>
                    <td> <button onClick="deleteItemFromCart(${item.animalId})" class='btn btn-danger btn-sm'>Remove</button>  </td>
                </tr>
                    `
            
            totalPrice+=item.animalPrice*item.animalQuantity;
        })
        
        table=table+ `
            <tr><td colspan='5' class='text-right font-weight-bold m-5'> Total Price : ${totalPrice}</td></tr>
            </table>`
        $(".cart-body").html(table);
        $(".checkout-btn").attr('disabled',false);
    }
}

//Delete Item from cart
function deleteItemFromCart(aId){
    
    let cart = JSON.parse(localStorage.getItem('cart'));
    
    let newcart = cart.filter((item)=> item.animalId != aId);
    
    localStorage.setItem('cart',JSON.stringify(newcart));
        
    updateCart();
    showToast("Animal is removed");
    
}


$(document).ready(function(){
    updateCart();  
})

//Showing Toast
function showToast(content){
    $("#toast").addClass("display");
    $("#toast").html(content);
    setTimeout(()=>{
        $("#toast").removeClass("display");
    },2000);
}

// cheout page call

function goToCheckout(){
    
    window.location="checkout.jsp";
    
}