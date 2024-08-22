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
   
    <div class="grid grid-cols-1 md:grid-cols-2 gap-4">

      <!-- --------------------LEFT SIDE SCREEN------------------------------------------ -->
      <div class="col-span-1 md:col-span-1 ml-4 md:ml-20 mx-auto my-8 md:my-16">
          <div class="relative overflow-x-auto shadow-md sm:rounded-lg">
              <table class="w-full text-sm text-left rtl:text-right text-gray-500 dark:text-gray-400">
                  <thead class="text-xs text-gray-700 uppercase bg-gray-100 dark:bg-gray-700 dark:text-gray-400">
                      <tr>
                          <th scope="col" class="px-6 md:px-16 py-3">
                              <span class="sr-only">Image</span>
                          </th>
                          <th scope="col" class="px-6 py-3">
                              Product
                          </th>
                          <th scope="col" class="px-6 py-3">
                              Quantity
                          </th>
                          <th scope="col" class="px-6 py-3">
                              Price per Day
                          </th>
                      </tr>
                  </thead>
                  <tbody id="tbody">
                      <c:forEach var="invoice_item" items="${invoice_items}" varStatus="cn">
                          <tr class="bg-white border-b dark:bg-gray-800 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-600">
                              <td class="p-4">
                                  <img src="show_tentwala_pic.do?picPath=${invoice_item.tentwalaItem.tentwalaItemPic}&tentwalaEmail=${tentwala_email}&flag=true" class="w-12 md:w-16 lg:w-32 max-w-full max-h-full" alt="">
                              </td>
                              <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white">
                                  ${invoice_item.tentwalaItem.item.name}
                              </td>
                              <td class="px-6 py-4">
                                  <div class="flex items-center">
                                      <div>
                                          <input type="number" disabled value="${invoice_item.bookedQuantity}" id="first_product" class="bg-gray-50 w-12 md:w-14 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block px-2.5 py-1 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="1">
                                      </div>
                                  </div>
                              </td>
                              <td class="px-6 py-4 font-semibold text-gray-900 dark:text-white">
                                  ${invoice_item.bookedQuantity * invoice_item.tentwalaItem.unitPrice} RS.
                              </td>
                          </tr>
                      </c:forEach>
                  </tbody>
              </table>
          </div>
      </div>
      <!-- --------------------LEFT SIDE SCREEN------------------------------------------ -->
  
      <!-- --------------------RIGHT SIDE SCREEN------------------------------------------ -->
      <div class="col-span-1 bg-gray-50 min-h-full flex-col justify-center px-4 sm:px-6 md:px-8 pt-8 md:pt-16 pb-16 md:pb-24 lg:px-8">
          <form action="checkout_next.do?invoice_id=${invoice_id}" method="post">
              <div class="space-y-12">
                  <div class="border-b border-gray-900/10 pb-8 md:pb-12">
                      <h2 class="text-base font-semibold leading-7 text-gray-900">Personal Information</h2>
                      <p class="mt-1 text-sm leading-6 text-gray-600">Use a permanent address where you can receive delivery.</p>
  
                      <div class="mt-6 md:mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
                          <div class="sm:col-span-3">
                              <label for="first-name" class="block text-sm font-medium leading-6 text-gray-900">Name</label>
                              <div class="mt-2">
                                  <input type="text" disabled value="${user.name}" id="first-name" required autocomplete="given-name" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                              </div>
                          </div>
  
                          <div class="sm:col-span-4">
                              <label for="email" class="block text-sm font-medium leading-6 text-gray-900">Email address</label>
                              <div class="mt-2">
                                  <input id="email" name="email" type="email" autocomplete="email" pattern="^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$" required class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                              </div>
                          </div>
  
                          <div class="sm:col-span-4">
                              <label for="phone" class="block text-sm font-medium leading-6 text-gray-900">Phone</label>
                              <div>
                                  <input type="text" id="phone" name="phone" required class="block w-full rounded-md border-0 py-1.5 pl-2 text-gray-900 shadow hover:shadow-2xl ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                                  <p class="hidden mt-1 text-sm text-red-500 dark:text-red-300" id="phone_error">Please enter a valid phone number!!</p>
                              </div>
                          </div>
  
                          <div class="col-span-full">
                              <label for="street-address" class="block text-sm font-medium leading-6 text-gray-900">Street address</label>
                              <div class="mt-2">
                                  <input type="text" name="street-address" id="street-address" autocomplete="street-address" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                              </div>
                          </div>
  
                          <div class="sm:col-span-2 sm:col-start-1">
                              <label for="city" class="block text-sm font-medium leading-6 text-gray-900">City</label>
                              <div class="mt-2">
                                  <input type="text" name="city" id="city" autocomplete="address-level2" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                              </div>
                          </div>
  
                          <div class="sm:col-span-2">
                              <label for="region" class="block text-sm font-medium leading-6 text-gray-900">State / Province</label>
                              <div class="mt-2">
                                  <input type="text" name="region" id="region" autocomplete="address-level1" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                              </div>
                          </div>
  
                          <div class="sm:col-span-2">
                              <label for="postal-code" class="block text-sm font-medium leading-6 text-gray-900">ZIP / Postal code</label>
                              <div class="mt-2">
                                  <input type="text" name="postal-code" id="postal-code" autocomplete="postal-code" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-indigo-600 sm:text-sm sm:leading-6">
                              </div>
                          </div>
                      </div>
                  </div>
  
                  <div date-rangepicker class="flex items-center">
                    <div class="relative">
                    <div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
                        <svg class="w-4 h-4 text-gray-500 dark:text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M20 4a2 2 0 0 0-2-2h-2V1a1 1 0 0 0-2 0v1h-3V1a1 1 0 0 0-2 0v1H6V1a1 1 0 0 0-2 0v1H2a2 2 0 0 0-2 2v2h20V4ZM0 18a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V8H0v10Zm5-8h10a1 1 0 0 1 0 2H5a1 1 0 0 1 0-2Z"/>
                        </svg>
                    </div>
                    <input  name="start" autocomplete="off" type="text" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full ps-10 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Select date start">
                    </div>
                    <span class="mx-4 text-gray-500">to</span>
                    <div class="relative">
                    <div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
                        <svg class="w-4 h-4 text-gray-500 dark:text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="currentColor" viewBox="0 0 20 20">
                            <path d="M20 4a2 2 0 0 0-2-2h-2V1a1 1 0 0 0-2 0v1h-3V1a1 1 0 0 0-2 0v1H6V1a1 1 0 0 0-2 0v1H2a2 2 0 0 0-2 2v2h20V4ZM0 18a2 2 0 0 0 2 2h16a2 2 0 0 0 2-2V8H0v10Zm5-8h10a1 1 0 0 1 0 2H5a1 1 0 0 1 0-2Z"/>
                        </svg>
                    </div>
                    <input name="end" autocomplete="off" type="text" class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-blue-500 focus:border-blue-500 block w-full ps-10 p-2.5  dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Select date end">
                </div>
                </div>
                
                <div>
                  <button type="submit"  id="next_btn" class="flex w-full justify-center rounded-md bg-gradient-to-r from-violet-500 to-fuchsia-500 px-3 py-3 text-sm font-semibold leading-6 text-white shadow-2xl hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600"><b>NEXT</b></button>
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