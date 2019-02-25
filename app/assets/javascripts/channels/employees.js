$(document).ready(function()
                {
                     $('#employee_city_id').change(function(){
                         var q = $(this).val();
                      $.ajax({
                            type: "GET",
                            url: "/employees/ajax",

                            data: {'keyword': q},
                            success: function(result){
                               // $('[data-toggle="tooltip"]').tooltip();


                           },
                           error: function (jqXHR, exception) {
                             alert("error");
                           }
                       })
                   })
                })