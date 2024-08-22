<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
            <a href="#" class="font-medium text-red-600 dark:text-red-500 hover:underline">Remove</a>
        </td>
    </tr>
</c:forEach>
