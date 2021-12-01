$(window.showSelectedValue = function(source){

  
  $('#col_select').change(function() {
    //console.log("VALUE ON CHANGE = ", this.value);
    //$('#buildings_id1').show();
    //console.log($('#buildings_id1').attr('id'));
    //console.log($('#buildings_id1').get(0).id);
    //console.log($('#buildings_id1').prop('id'));
    $('#buildings_id1').removeAttr('hidden');
    //$(this).next("div").toggle(); 
    var data = {};
    console.log("source = ", source);
    $.ajax({
      dataType: 'json',
      url: "/get_buildings/" + source,
      data: data,
      success: function(data, status){
        console.log("source = ", source);
        //console.log(data);
        console.log("data[0]['full_name_of_the_building_administrator'] = ", data[0]['full_name_of_the_building_administrator']);
  
        var array = [];
        
        //$("#buildings_id1").empty();
        var key_out = [];


        for (var i = 0; i < data.length; i++) {
          $('#build_select').append($('<option/>', { 
            key: data[i].id,
            text : data[i].full_name_of_the_building_administrator 
          }));
        }
/*
        $.each(data, function(key, value)
        {
          console.log("value.full_name_of_the_building_administrator = ", value.full_name_of_the_building_administrator);
          console.log("value.id = ", value.id);
            //key_out += key.id;

            //$("#build_select").append('<option value=' + key.id + '>' + value.full_name_of_the_building_administrator + '</option>');
            //$('#build_select').each(function() {
            //  if ( $(this).val() != key.id ) {
            //      $(this).remove();
            //  }
            //});
        });
*/
                //$("#buildings_id1").empty();
/*
        $.each(data, function()
        {
          //console.log("value.full_name_of_the_building_administrator = ", value.full_name_of_the_building_administrator);
          //console.log("value.id = ", value.id);
            //$("#build_select").append('<option value=' + key.id + '>' + value.full_name_of_the_building_administrator + '</option>');
            $('#build_select').each(function() {
              if ( $(this).val() != key_out ) {
                  $(this).remove();
              }
            });
        });
  */      
        /*
        for (var i = 0; i < data.length; i++) {
          $("#build_select").append("<option value=" + data[i].id + ">" + data[i].full_name_of_the_building_administrator + "</option>") ;
        }
        */
        //var $el = $("#buildings_id1");
        //$el.append($("<option></option>"));
          //$('#col_select').html
      }
    });
  });
  


/*
    console.log("showSelectedValue");
    var ajax = new XMLHttpRequest();
    var method = "GET";
    var data = {};
    
    $.ajax({
      dataType: 'json',
      url: "/get_buildings/" + source,
      data: data,
      success: function(data, status){
          console.log("source = ", source);
          console.log(data);
          console.log("data[0]['full_name_of_the_building_administrator'] = ", data[0]['full_name_of_the_building_administrator']);
          $('#col_select').change(function() {
            //console.log("VALUE ON CHANGE = ", this.value);
            $('#buildings_id1').show();
          });
          
          var $el = $("#col_select");
            //$el.empty(); // remove old options
            //$.each(data, function(key, ) {
            //$el.append($("<option></option>").attr("value", data[0].full_name_of_the_building_administrator).text(key));
            $el.append($("<option></option>"));
            $('#col_select').html
          //});

      }});

    */

    var value = source;
    //console.log(value);
    return value;
});

