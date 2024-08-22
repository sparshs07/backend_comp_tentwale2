<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://unpkg.com/dropzone@5/dist/min/dropzone.min.css" type="text/css" />
    <script src="https://unpkg.com/dropzone@5/dist/min/dropzone.min.js"></script>
</head>
<body class="flex flex-col min-h-screen">
    <!-- ##############HEADER################## -->
        <c:import url="header.jsp" />
    <!-- ##############HEADER################## -->

<!-- ##############################BODY############################ -->
<div class="flex-grow grid grid-cols-1 md:grid-cols-2 lg:grid-cols-2 gap-8 p-6 lg:p-12">
  <!-- -----------LEFT SIDE--------------- -->
  <div class="flex flex-col items-center justify-center px-6 lg:px-12">
    <div class="w-full max-w-md h-96 flex flex-col items-center justify-center rounded-lg px-6 py-4 bg-white shadow-md">
      <div class="text-center">
        <svg class="mx-auto h-16 w-16 text-gray-300" viewBox="0 0 24 24" fill="currentColor" aria-hidden="true">
          <path fill-rule="evenodd" d="M1.5 6a2.25 2.25 0 012.25-2.25h16.5A2.25 2.25 0 0122.5 6v12a2.25 2.25 0 01-2.25 2.25H3.75A2.25 2.25 0 011.5 18V6zM3 16.06V18c0 .414.336.75.75.75h16.5A.75.75 0 0021 18v-1.94l-2.69-2.689a1.5 1.5 0 00-2.12 0l-.88.879.97.97a.75.75 0 11-1.06 1.06l-5.16-5.159a1.5 1.5 0 00-2.12 0L3 16.061zm10.125-7.81a1.125 1.125 0 112.25 0 1.125 1.125 0 01-2.25 0z" clip-rule="evenodd" />
        </svg>
        <div class="mt-4 flex text-lg leading-6 text-gray-600">
          <label for="file-upload" class="relative cursor-pointer rounded-md bg-white font-semibold text-indigo-600 focus-within:outline-none focus-within:ring-2 focus-within:ring-indigo-600 focus-within:ring-offset-2 hover:text-indigo-500">
            <form action="upload_pic.do" method="post" class="dropzone rounded-lg border border-dashed border-gray-900/25 w-full" id="pic-upload-form">
            </form>
          </label>
        </div>
        <p class="text-xs leading-5 text-gray-600">PNG, JPG, GIF up to 10MB</p>
      </div>  
    </div>
  </div>
  <!-- -----------LEFT SIDE--------------- -->

  <!-- -----------RIGHT SIDE--------------- -->
  <div class="flex flex-col items-center justify-center px-6 lg:px-12">
    <form class="w-full max-w-3xl mx-auto" action="add_tentwala_item.do" method="post">
      <div class="relative z-0 w-full mb-8 group">
        <select name="select_item" id="floating_departments" class="block py-3 px-0 w-full text-xl text-gray-500 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer" required>
          <option value="" disabled selected>Select Item</option>
          <c:forEach var="item_type" items="${item_types}" varStatus="cn">
            <optgroup class="text-gray-900" label="${item_type.name}">
              <c:forEach var="item" items="${items}" varStatus="cn">
                <c:if test="${item_type.itemTypeId == item.itemType.itemTypeId}">
                  <option value="${item.itemId}">${item.name}</option>
                </c:if>
              </c:forEach>
            </optgroup>
          </c:forEach>
        </select>
      </div>

      <div class="relative z-0 w-full mb-8 group">
        <textarea id="floating_message" readonly class="block py-3 px-0 w-full text-xl text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required></textarea>
        <label for="floating_message" class="peer-focus:font-medium absolute text-lg text-gray-500 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Item Description</label>
      </div>

      <div class="relative z-0 w-full mb-8 group">
        <input type="number" name="item_quantity" id="floating_number" autocomplete="off" class="block py-3 px-0 w-full text-xl text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
        <label for="item_quantity" class="peer-focus:font-medium absolute text-lg text-gray-500 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Item Quantity</label>
      </div>

      <div class="relative z-0 w-full mb-8 group">
        <input type="text" name="price_per_item" id="floating_text" autocomplete="off" class="block py-3 px-0 w-full text-xl text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required />
        <label for="price_per_item" class="peer-focus:font-medium absolute text-lg text-gray-500 duration-300 transform -translate-y-6 scale-75 top-3 -z-10 origin-[0] peer-focus:start-0 rtl:peer-focus:translate-x-1/4 peer-focus:text-blue-600 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Price per Item</label>
      </div>

      <div>
        <input hidden type="text" name="user_tentwala_id" value="${user.userId}">
        <input hidden type="text" name="pic_name" id="pic_name" value="">
      </div>
      <button type="submit" class="text-white bg-blue-700 hover:bg-blue-800 focus:ring-4 focus:outline-none focus:ring-blue-300 font-medium rounded-lg text-lg w-full px-6 py-3 text-center">Add Item</button>
    </form>
  </div>
  <!-- -----------RIGHT SIDE--------------- -->
</div>

<!-- ##############################BODY############################ -->

    <!-- #################FOOTER#################### -->
    <c:import url="footer.jsp" />
    <!-- #################FOOTER#################### -->

<!-- --------------------DESCRIPTION--------------------- -->
<script>
  let floating_departments=document.querySelector("#floating_departments");
  let floating_message=document.querySelector("#floating_message");

  let get_description=async ()=>{
    let response=await fetch('item_description.do?item_id='+floating_departments.value);
    let result=await response.text();
    return result;
  }

  floating_departments.addEventListener('blur',()=>{
    get_description().then((data)=>{
      console.log(data);
     floating_message.innerText=data;
    }).catch((error)=>{
      console.log(error);
    })
  })

</script>
<!-- --------------------DESCRIPTION--------------------- -->

<!-- --------------------------MENU BUTTON------------------------ -->
<script>
let home=document.querySelector("#home")
home.href="tentwala_home.do"

let about=document.querySelector("#about")
about.innerText="Add Items"
about.href="tentwala_home_profile.do"

let services=document.querySelector("#services")
services.innerText="Your Items"
services.href="your_items.do"
</script>
<!-- --------------------------MENU BUTTON------------------------ -->


<!-- ----------------HIDDING----------------------- -->
<script>
  let want_bec_tentw=document.querySelector("#want_bec_tentw");
  want_bec_tentw.classList.add("hidden");
</script>
<!-- ----------------HIDDING----------------------- -->

<!-- -----------------DROPZONE----------------------- -->
<script>
// Initialize Dropzone with custom thumbnail dimensions
let picUploadForm=document.querySelector('#pic-upload-form')
let pic_name=document.querySelector("#pic_name")
Dropzone.options.picUploadForm = {
  maxFilesize: 5,
  maxFiles:1,
  init: function() {
  this.on("addedfile", function(file) {
    pic_name.value=file.name
    // Remove previous file if any
    if (this.files.length > 1) {
      this.removeFile(this.files[0]);
    }
  });

  this.on("thumbnail", function(file, dataUrl) {
    // Set the desired width and height for the displayed image
    var thumbnail = file.previewElement.querySelector(".dz-image img");
    var thumbnailn = file.previewElement.querySelector(".dz-image");
    thumbnail.style.width = "200px";
    thumbnail.style.height = "200px";

    thumbnailn.style.width = "200px";
    thumbnailn.style.height = "200px";
    
  });

  this.on("error", function(file, errorMessage, xhr) {

// You can display a more user-friendly message to the user if needed
if (xhr && xhr.status === 0) {
  alert("Server not reachable.Please try again to upload image.");
} else if (xhr && xhr.status === 413) {
  alert("File size exceeds the maximum limit of 5 MB.");
} else {
  alert("An error occurred during the file upload. Please try again.");
}
});
  
  // other options and callbacks go here
}
  // other options and callbacks go here
};
</script>

<!-- ------------------Display Tentwala Name------------------ -->
<script>
let display_name=document.querySelector("#display_name");
let tentwala_name="${user.tentwalaName}"
display_name.innerHTML=tentwala_name
</script>
<!-- ------------------Display Tentwala Name------------------ -->


<!-- -----------------DROPZONE----------------------- -->

<script src="https://cdnjs.cloudflare.com/ajax/libs/flowbite/2.2.0/flowbite.min.js"></script>
</body>
</html>
