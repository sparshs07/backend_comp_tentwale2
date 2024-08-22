<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.css" rel="stylesheet" />

</head>
<body>
    <!-- ##############HEADER################## -->
        <c:import url="header.jsp" />
    <!-- ##############HEADER################## -->

    <!-- ----------------BODY-------------------- -->
    
    <!-- -------------------------CART ITEM ADDED----------------------------------- -->
    <div id="toast-simple" class="hidden fixed top-5 right-1/2 flex items-center w-full max-w-xs  p-4 space-x-4 rtl:space-x-reverse text-gray-500 bg-white divide-x rtl:divide-x-reverse divide-gray-200 rounded-lg shadow dark:text-gray-400 dark:divide-gray-700 space-x dark:bg-gray-800" role="alert">
    
      <div class="inline-flex items-center justify-center flex-shrink-0 w-12 h-12 text-green-500 bg-green-100 rounded-lg dark:bg-green-800 dark:text-green-200">
        <svg class="w-5 h-5" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
            <path d="M10 .5a9.5 9.5 0 1 0 9.5 9.5A9.51 9.51 0 0 0 10 .5Zm3.707 8.207-4 4a1 1 0 0 1-1.414 0l-2-2a1 1 0 0 1 1.414-1.414L9 10.586l3.293-3.293a1 1 0 0 1 1.414 1.414Z"/>
        </svg>
      </div>
   
      <div class="ps-4 text-sm font-normal">Item added successfully.</div>
    </div>
    <!-- -------------------------CART ITEM ADDED----------------------------------- -->
    
    <div class="max-w-7xl ml-32 mt-9 mb-9 ">
    
  
  <c:forEach var="tentwala_item_type" items="${tentwala_item_types}" varStatus="cn">
  <div id="accordion-collapse-${cn.count}" data-accordion="close" data-active="false">
    <h2 id="item${cn.count}">
      <button type="button" class="flex items-center justify-between w-full p-5 font-medium rtl:text-right text-gray-500 border border-b-0 border-gray-200 rounded-t-xl focus:ring-4 focus:ring-gray-200 dark:focus:ring-gray-200 dark:border-gray-700 dark:text-gray-500 hover:bg-gray-100 dark:hover:bg-gray-800 gap-3" data-accordion-target="#accordion-collapse-body${cn.count}" aria-expanded="true" aria-controls="accordion-collapse-body${cn.count}">
        <!-- <span>${tentwala_item_type.name}</span> -->
        <h3 class="text-5xl font-extrabold dark:text-white">${tentwala_item_type.name}</h3>                
        <svg data-accordion-icon class="w-3 h-3 rotate-180 shrink-0" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 10 6">
          <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 5 5 1 1 5"/>
        </svg>
      </button>
    </h2>
    <div id="accordion-collapse-body${cn.count}" class="hidden" aria-labelledby="item${cn.count}">
      <div class="flex flex-wrap justify-start bg-blue-100">
          <c:forEach var="tentwala_content" items="${tentwala_contents}" varStatus="cm">
              <c:if test="${tentwala_item_type.itemTypeId==tentwala_content.item.itemType.itemTypeId}">
                  <div class="mx-5 my-8 flex flex-col bg-white border border-gray-200 rounded-lg shadow dark:bg-gray-800 dark:border-gray-700 hover:shadow-2xl">
                      
                          <img class="rounded-t-lg h-52 w-64" src="show_tentwala_pic.do?picPath=${tentwala_content.tentwalaItemPic}&tentwalaEmail=${tentwala_email}&flag=true" alt="" />
                      
                      <div class="p-5 max-w-64 max-h-72">
                          
                              <h5 class="mb-2 text-lg font-bold tracking-tight text-gray-900 dark:text-white">${tentwala_content.item.name}</h5>
                          
                          <p class="mb-3 text-wrap text-sm font-normal text-gray-700 dark:text-gray-400">${tentwala_content.item.description}</p>
                          <p class="mb-3 text-wrap text-sm font-normal text-gray-700 dark:text-gray-400"> <b>Available Quantity: </b>${tentwala_content.totalQuantity}</p>
                          <p class="mb-3 text-wrap text-sm font-normal text-gray-700 dark:text-gray-400"><b>Unit Price/Day(Rs.): </b>${tentwala_content.unitPrice}</p>
                          
                          <!-- <label for="bedrooms-input" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Choose quantity:</label> -->
                          <div class="relative flex items-center max-w-[15rem] mb-2">
                            <!-- ----------LEFT---------------- -->
                              <button type="button" id="decrement-button${cm.count}" data-input-counter-decrement="bedrooms-input${cm.count}" class="bg-gray-100 dark:bg-gray-700 dark:hover:bg-gray-600 dark:border-gray-600 hover:bg-gray-200 border border-gray-300 rounded-s-lg p-3 h-8 focus:ring-gray-100 dark:focus:ring-gray-700 focus:ring-2 focus:outline-none">
                                  <svg class="w-3 h-3 text-gray-900 dark:text-white" aria-hidden="true" xmlns="https://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 2">
                                      <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M1 1h16"/>
                                  </svg>
                              </button>
                            <!-- ----------LEFT---------------- -->

                            <!-- ----------CENTER---------------- -->
                            <input type="text" id="bedrooms-input${cm.count}" data-input-counter data-input-counter-min="0" data-input-counter-max="100" aria-describedby="helper-text-explanation" class="quantity border-x-0 border-gray-300 h-6 font-medium text-center text-gray-900 text-sm focus:ring-blue-500 focus:border-blue-500 block w-full pb-6 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="" value="0" required>
                            <div class="absolute bottom-1 start-1/2 -translate-x-1/2 rtl:translate-x-1/2 flex items-center text-xs text-gray-400 space-x-1 rtl:space-x-reverse">
                              <span>Your Quantity</span>
                            </div>
                            <!-- ----------CENTER---------------- -->

                            <!-- ----------RIGHT---------------- -->
                              <button type="button" id="increment-button${cm.count}" data-input-counter-increment="bedrooms-input${cm.count}" class="bg-gray-100 dark:bg-gray-700 dark:hover:bg-gray-600 dark:border-gray-600 hover:bg-gray-200 border border-gray-300 rounded-e-lg p-3 h-8 focus:ring-gray-100 dark:focus:ring-gray-700 focus:ring-2 focus:outline-none">
                                  <svg class="w-3 h-3 text-gray-900 dark:text-white" aria-hidden="true" xmlns="https://www.w3.org/2000/svg" fill="none" viewBox="0 0 18 18">
                                      <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 1v16M1 9h16"/>
                                  </svg>
                              </button>
                            <!-- ----------RIGHT---------------- -->
                          </div>
                          <!-- <p id="helper-text-explanation" class="mt-2 text-sm text-gray-500 dark:text-gray-400">Please select the number of bedrooms.</p> -->
                      

                          
                          <button  value="${tentwala_content.tentwalaItemId}" id="add_to_cart" class="add_to_cart inline-flex items-center px-3 py-2 text-sm font-medium text-center text-white bg-blue-700 rounded-lg hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">
                              Add To Cart 
                          </button>
                          
                      </div>
                  </div>
              </c:if>
          </c:forEach>
      </div>
  </div>
  </div>
</c:forEach>

<!-- ----------------------------CART MODAL--------------------------------------- -->

<!-- Main modal -->
<div id="default-modal-1" tabindex="-1" aria-hidden="true" class="hidden overflow-y-auto overflow-x-hidden fixed top-0 right-0 left-0 z-50 justify-center items-center w-full md:inset-0 h-[calc(100%-1rem)] max-h-full">
    <div class="relative p-4 w-full max-w-2xl max-h-full">
        <!-- Modal content -->
        <div class="relative bg-white rounded-lg shadow dark:bg-gray-700">
            <!-- Modal header -->
            <div class="flex items-center justify-between p-4 md:p-5 border-b rounded-t dark:border-gray-600">
                <h3 class="text-xl font-semibold text-gray-900 dark:text-white">
                    Your Cart Items!
                </h3>
                <button type="button" class="text-gray-400 bg-transparent hover:bg-gray-200 hover:text-gray-900 rounded-lg text-sm w-8 h-8 ms-auto inline-flex justify-center items-center dark:hover:bg-gray-600 dark:hover:text-white" data-modal-hide="default-modal-1">
                    <svg class="w-3 h-3" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 14 14">
                        <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m1 1 6 6m0 0 6 6M7 7l6-6M7 7l-6 6"/>
                    </svg>
                    <span class="sr-only">Close modal</span>
                </button>
            </div>

            <!-- Modal body -->
<div class="p-4 md:p-5 space-y-4">
<div class="relative overflow-x-auto shadow-md sm:rounded-lg">
  <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
      <thead class="text-xs text-gray-700 uppercase bg-blue-100 dark:bg-gray-700 dark:text-gray-400">
          <tr>
              <th scope="col" class="px-16 py-3">
                  <span class="sr-only">Image</span>
              </th>
              <th scope="col" class="px-6 py-3">
                  Product
              </th>
              <th scope="col" class="px-6 py-3">
                  Quantity
              </th>
              <th scope="col" class="px-6 py-3">
                 Total Price/Day
              </th>
              <th scope="col" class="px-6 py-3">
                  Action
              </th>
          </tr>
      </thead>
      <tbody id="tbody">
        
        
          <c:forEach var="invoice_item" items="${invoice_items}" varStatus="cn">
          <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">


              <td class="p-4">
                  <img src="show_tentwala_pic.do?picPath=${invoice_item.tentwalaItem.tentwalaItemPic}&tentwalaEmail=${tentwala_email}&flag=true" class="w-16 md:w-32 max-w-full max-h-full" alt="">
              </td>
              <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white">
                  ${invoice_item.tentwalaItem.item.name}
              </td>
              <td class="px-6 py-4">
                  <div class="flex items-center">
                      <div>
                          <input type="number" disabled value="${invoice_item.bookedQuantity}" id="first_product" class="bg-gray-50 w-14 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block px-2.5 py-1 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="1">
                      </div>
                      
                  </div>
              </td>
              <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white">
                  ${invoice_item.bookedQuantity * invoice_item.tentwalaItem.unitPrice} RS.
              </td> 
              <td class="px-6 py-4">
                  <button  value="${invoice_item.invoiceItemId}"  id="remove_cart_item" class="remove_cart_item font-medium text-red-600 dark:text-red-500 hover:underline">Remove</button>
              </td>
              
            </tr>
        </c:forEach>
      </tbody>
  </table>
</div>
<!-- Modal body -->
            </div>
            <!-- Modal footer -->
            <div class="flex items-center p-4 md:p-5 border-t border-gray-200 rounded-b dark:border-gray-600">
                <a href="checkout_cart.do?invoice_id=${invoice_id}" id="checkout_btn" data-modal-hide="default-modal-1" type="button" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-blue-600 dark:hover:bg-blue-700 dark:focus:ring-blue-800">Checkout Cart</a>
                <button data-modal-hide="default-modal-1" type="button" class="ms-3 text-gray-500 bg-white hover:bg-gray-100 focus:ring-4 focus:outline-none focus:ring-blue-300 rounded-lg border border-gray-200 text-sm font-medium px-5 py-2.5 hover:text-gray-900 focus:z-10 dark:bg-gray-700 dark:text-gray-300 dark:border-gray-500 dark:hover:text-white dark:hover:bg-gray-600 dark:focus:ring-gray-600">Decline</button>
            </div>
        </div>
    </div>
</div>

<!-- ----------------------------CART MODAL--------------------------------------- -->

</div>
  
    <!-- ----------------BODY-------------------- -->

    <!-- #################FOOTER#################### -->
    <!-- <div class="min-h-screen flex flex-col">
        <div class="fixed bottom-0 left-0 right-0"> -->
            <c:import url="footer.jsp" />
        <!-- </div> -->
    <!-- </div> -->
    <!-- #################FOOTER#################### -->
    

    <script>
      let add_to_cart_btn=document.getElementsByClassName("add_to_cart");
      let invoice_id="${invoice_id}";
      let quantity=document.getElementsByClassName("quantity");
      let simple_toast=document.querySelector("#toast-simple");

      let add_to_invoice_items=async(tentwala_item_id,quantity)=>{
        let response=await fetch('add_invoice_items.do?invoice_id='+invoice_id+'&tentwala_item_id='+tentwala_item_id+'&quantity='+quantity);
        let result=await response.text();
        return result;
      }

      for(let i=0;i<add_to_cart_btn.length ;i++){
        add_to_cart_btn[i].addEventListener('click',()=>{
          add_to_invoice_items(add_to_cart_btn[i].value,quantity[i].value).then((data)=>{
            if(data=="true"){
              setTimeout(function(){ simple_toast.classList.remove('hidden');}, 300);
                setTimeout(function(){ window.location.reload();}, 1500);
                
            }
          }).catch((error)=>{
            console.log(error);
          })

        })
      }
    </script>
    <script>
      let cart=document.querySelector("#cart");
      
      cart.classList.remove("hidden");
      let invoice_id_1="${invoice_id}";
      let tbody=document.querySelector("#tbody");

      let show_cart_items=async()=>{
        let response=await fetch('show_cart_items.do?invoice_id='+invoice_id_1);
        let result=await response.text();
        return result;
      }

      cart.addEventListener('click',()=>{
        show_cart_items().then((data)=>{
            if(data=="true"){

             
            }

        }).catch((error)=>{
          console.log(error)
        })
      })

    </script>

    

    

    <script>
        let about=document.querySelector("#about")
        about.innerText="Find TentWale!"
        about.href="find_tentwale.do"

        let service=document.querySelector("#services")
        service.classList.add("hidden")
        
    </script>

    <script>
        let remove_cart_item=document.getElementsByClassName('remove_cart_item');
        let checkout_btn=document.querySelector('#checkout_btn');

        // if(remove_cart_item.length===0){
        //   checkout_btn.classList.add('disable')
        // }

      let remove_invoice_items=async(invoice_item_id)=>{
        let response=await fetch('remove_cart_item.do?invoice_item_id='+invoice_item_id);
        let result=await response.text();
        return result;
      }

      for(let i=0;i<add_to_cart_btn.length ;i++){
        remove_cart_item[i].addEventListener('click',()=>{
          remove_invoice_items(remove_cart_item[i].value).then((data)=>{
            if(data=="true"){
                window.location.reload();
            }
          }).catch((error)=>{
            console.log(error);
          })
        })
      }
    </script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.js"></script>
</body>
</html>