<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.1/datepicker.min.js"></script>

</head>
<body>
    <!-- ##############HEADER################## -->
        <c:import url="header.jsp" />
    <!-- ##############HEADER################## -->

    <!-- ----------------BODY-------------------- -->
   
    <div class="grid grid-cols-1 lg:grid-cols-2 gap-8 p-6">

      <!-- --------------------LEFT SIDE SCREEN------------------------------------------ -->
      <div class="p-6 bg-white shadow-lg rounded-lg">
          <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
              <table class="w-full text-sm text-gray-500 dark:text-gray-400">
                  <thead class="text-xs text-gray-700 uppercase bg-gray-100 dark:bg-gray-700 dark:text-gray-400">
                      <tr>
                          <th scope="col" class="px-4 py-3 text-left">
                              <span class="sr-only">Image</span>
                          </th>
                          <th scope="col" class="px-4 py-3 text-left">Product</th>
                          <th scope="col" class="px-4 py-3 text-left">Quantity</th>
                          <th scope="col" class="px-4 py-3 text-left">Price per Day</th>
                          <th scope="col" class="px-4 py-3 text-left">Total Price for ${booked_days} Days</th>
                      </tr>
                  </thead>
  
                  <tbody id="tbody">
                      <c:forEach var="invoice_item" items="${invoice_items}" varStatus="cn">
                          <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
                              <td class="p-4">
                                  <img src="show_tentwala_pic.do?picPath=${invoice_item.tentwalaItem.tentwalaItemPic}&tentwalaEmail=${tentwala_email}&flag=true"
                                      class="w-16 md:w-24 h-auto object-cover rounded-md" alt="">
                              </td>
                              <td class="px-4 py-4 font-semibold text-gray-900 dark:text-white">
                                  ${invoice_item.tentwalaItem.item.name}
                              </td>
                              <td class="px-4 py-4">
                                  <input type="number" disabled value="${invoice_item.bookedQuantity}"
                                      class="bg-gray-50 w-14 border border-gray-300 text-gray-900 text-sm rounded-lg py-1.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white"
                                      placeholder="1">
                              </td>
                              <td class="px-4 py-4 font-semibold text-gray-900 dark:text-white">
                                  ${invoice_item.bookedQuantity * invoice_item.tentwalaItem.unitPrice} RS.
                              </td>
                              <td class="px-4 py-4 font-semibold text-gray-900 dark:text-white">
                                  ${invoice_item.bookedQuantity * invoice_item.tentwalaItem.unitPrice * booked_days} RS.
                              </td>
                              <c:set var="total" value="${total + invoice_item.bookedQuantity * invoice_item.tentwalaItem.unitPrice * booked_days}" />
                          </tr>
                      </c:forEach>
                  </tbody>
  
                  <tfoot>
                      <tr class="font-semibold text-gray-900 dark:text-black">
                          <th scope="row" class="px-4 py-3 text-lg text-gray-900 dark:text-black">Total</th>
                          <td class="px-4 py-3"></td>
                          <td class="px-4 py-3"></td>
                          <td class="px-4 py-3"></td>
                          <td class="px-4 py-3 text-lg font-bold text-gray-900 dark:text-white">
                              ${total} RS.
                          </td>
                      </tr>
                  </tfoot>
              </table>
          </div>
      </div>
      <!-- --------------------LEFT SIDE SCREEN------------------------------------------ -->
  
      <!-- --------------------RIGHT SIDE SCREEN------------------------------------------ -->
      <div class="bg-gray-50 p-6 rounded-lg shadow-lg">
          <form action="order_placed.do" method="post">
              <div class="space-y-6">
                  <div class="border-b border-gray-900/10 pb-6">
                      <h2 class="text-lg font-semibold text-gray-900">Checkout Information</h2>
                      <p class="mt-1 text-sm text-gray-600">Use a permanent address where you can receive delivery.</p>
  
                      <div class="mt-6 grid grid-cols-1 gap-y-4 sm:grid-cols-2 sm:gap-x-6 sm:gap-y-4">
                          <div>
                              <label for="first-name" class="block text-sm font-medium text-gray-900">Tentwala Name</label>
                              <div class="mt-1">
                                  <input type="text" disabled value="${tentwala_name}" id="first-name"
                                      class="block w-full rounded-md border-gray-300 shadow-sm focus:ring-indigo-600 sm:text-sm" required>
                              </div>
                          </div>
  
                          <div>
                              <label for="street-address" class="block text-sm font-medium text-gray-900">Tentwala Address</label>
                              <div class="mt-1">
                                  <input type="text" value="${tentwala_address}" name="street-address" id="street-address"
                                      class="block w-full rounded-md border-gray-300 shadow-sm focus:ring-indigo-600 sm:text-sm">
                              </div>
                          </div>
  
                          <div>
                              <label for="street-address" class="block text-sm font-medium text-gray-900">Your Address</label>
                              <div class="mt-1">
                                  <input type="text" readonly value="${delivery_address}" name="street-address" id="street-address"
                                      class="block w-full rounded-md border-gray-300 shadow-sm focus:ring-indigo-600 sm:text-sm">
                              </div>
                          </div>
  
                          <div>
                              <label for="region" class="block text-sm font-medium text-gray-900">Booked From</label>
                              <div class="mt-1">
                                  <input type="text" readonly value="${booked_from}" name="region" id="region"
                                      class="block w-full rounded-md border-gray-300 shadow-sm focus:ring-indigo-600 sm:text-sm">
                              </div>
                          </div>
  
                          <div>
                              <label for="postal-code" class="block text-sm font-medium text-gray-900">Booked To</label>
                              <div class="mt-1">
                                  <input type="text" readonly value="${booked_to}" name="postal-code" id="postal-code"
                                      class="block w-full rounded-md border-gray-300 shadow-sm focus:ring-indigo-600 sm:text-sm">
                              </div>
                          </div>
  
                          <div>
                              <label for="postal-code" class="block text-sm font-medium text-gray-900">Total Days</label>
                              <div class="mt-1">
                                  <input type="text" name="postal-code" readonly value="${booked_days}" id="postal-code"
                                      class="block w-full rounded-md border-gray-300 shadow-sm focus:ring-indigo-600 sm:text-sm">
                              </div>
                          </div>
  
                          <div>
                              <label for="first-name" class="block text-sm font-medium text-gray-900">Total Price to Pay</label>
                              <div class="mt-1">
                                  <input type="text" disabled  value="${total}" id="first-name" class="block w-full rounded-md border-gray-300 shadow-sm focus:ring-indigo-600 sm:text-sm" required>
                              </div>
                          </div>
                          <input type="text" name="total_price" value="${total}" hidden >
      
                      </div>
                  </div>
  
                  <div class="flex gap-4">
                      <button type="button" class="text-white bg-black hover:bg-gray-800 rounded-lg text-sm px-5 py-2.5 flex items-center">
                          <svg class="w-5 h-5 me-2" aria-hidden="true" focusable="false" data-prefix="fab" data-icon="apple"
                              role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 384 512">
                              <path fill="currentColor"
                                  d="M318.7 268.7c-.2-36.7 16.4-64.4 50-84.8-18.8-26.9-47.2-41.7-84.7-44.6-35.5-2.8-74.3 20.7-88.5 20.7-15 0-49.4-19.7-76.4-19.7C63.3 141.2 4 184.8 4 273.5q0 39.3 14.4 81.2c12.8 36.7 59 126.7 107.2 125.2 25.2-.6 43-17.9 75.8-17.9 31.8 0 48.3 17.9 76.4 17.9 48.6-.7 90.4-82.5 102.6-119.3-65.2-30.7-61.7-90-61.7-91.9zm-56.6-164.2c27.3-32.4 24.8-61.9 24-72.5-24.1 1.4-52 16.4-67.9 34.9-17.5 19.8-27.8 44.3-25.6 71.9 26.1 2 49.9-11.4 69.5-34.3z">
                              </path>
                          </svg>
                          Check out with Apple Pay
                      </button>
  
                      <button type="button" class="text-white bg-blue-700 hover:bg-blue-600 rounded-lg text-sm px-5 py-2.5 flex items-center">
                          <svg aria-hidden="true" class="w-18 h-5 me-2" viewBox="0 0 256 64" fill="none"
                              xmlns="http://www.w3.org/2000/svg">
                              <path
                                  d="M28.812 0L0 63.76H34.492L38.768 53.594H48.542L52.818 63.76H90.784V56.001L94.167 63.76H113.806L117.189 55.837V63.76H196.148L205.749 53.858L214.739 63.76L255.294 63.842L226.391 32.058L255.294 0H215.368L206.022 9.71899L197.315 0H111.418L104.042 16.457L96.493 0H62.073V7.495L58.244 0C58.244 0 28.812 0 28.812 0ZM35.486 9.05399H52.299L71.41 52.29V9.05399H89.828L104.589 40.054L118.193 9.05399H136.519V54.806H125.368L125.277 18.955L109.02 54.806H99.045L82.697 18.955V54.806H59.757L55.408 44.549H31.912L27.572 54.797H15.281C15.281 54.797 35.486 9.05399 35.486 9.05399ZM146.721 9.05399H192.063L205.931 24.034L220.246 9.05399H234.114L213.043 32.049L234.114 54.779H219.617L205.749 39.625L191.361 54.779H146.721V9.05399ZM43.665 16.795L35.924 35.067H51.397L43.665 16.795ZM157.918 18.527V26.879H182.654V36.188H157.918V45.306H185.663L198.555 31.876L186.21 18.519H157.918V18.527Z"
                                  fill="white"></path>
                          </svg>
                          Pay with American Express
                      </button>
                  </div>
  
                  <div>
                      <button type="submit"
                          class="w-full rounded-md bg-gradient-to-r from-purple-500 to-pink-500 px-4 py-3 text-sm font-semibold text-white shadow-lg hover:bg-indigo-500 focus:outline-none focus:ring-2 focus:ring-indigo-600">
                          <b>PLACE ORDER</b>
                      </button>
                  </div>
              </div>
          </form>
      </div>
      <!-- --------------------RIGHT SIDE SCREEN------------------------------------------ -->
  
  </div>
  

    <!-- ----------------BODY-------------------- -->

    <!-- #################FOOTER#################### -->
    <!-- <div class="min-h-screen flex flex-col">
        <div class="fixed bottom-0 left-0 right-0"> -->
            <c:import url="footer.jsp" />
        <!-- </div>
    </div> -->
    
    <!-- #################FOOTER#################### -->

    <script>
        let about=document.querySelector("#about")
        about.innerText="Find TentWale!"
        about.href="find_tentwale.do"

        let service=document.querySelector("#services")
        service.classList.add("hidden")
        
    </script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.js"></script>
</body>
</html>