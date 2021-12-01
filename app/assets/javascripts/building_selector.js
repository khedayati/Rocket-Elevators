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
        console.log(data);
        console.log("data[0]['full_name_of_the_building_administrator'] = ", data[0]['full_name_of_the_building_administrator']);
  
        var array = [];        
        //$("#buildings_id1").empty();
        var key_out = [];

        $('#build_select').find('option').not(':first').remove();
        for (var i = 0; i < data.length; i++) {
          $('#build_select').append($('<option/>', { 
            key: data[i].id,
            text : data[i].full_name_of_the_building_administrator
          }));
        }
      }
    });
  });

  $('#build_select').change(function() {
    console.log("build_select changed");
    $('#batteries_id1').removeAttr('hidden');
    var data2 = {};
    var data = null;
    $.ajax({
      data3: data2,
      dataType: 'json',
      url: "/get_batteries/" + source,
      
      success: function(data3, status){
        console.log("source = ", source);
        console.log(data3);
        console.log("data[0]['battery_type'] = ", data3[0]['battery_type']);
  
        var array = [];        
        //$("#buildings_id1").empty();
        var key_out = [];

        $('#build_select').find('option').not(':first').remove();
        for (var i = 0; i < data3.length; i++) {
          $('#build_select').append($('<option/>', { 
            key: data3[i].id,
            text : data3[i].battery_type
          }));
        }
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

