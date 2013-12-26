$(document).ready(function() {
    function patternMaker(){
      // user input
      var units = $("#units").val(); //either cm or inchs
      var skirt_type = $("#skirt_type").val(); //either full circle or half circle
      var waist = parseInt($("#waist").val());
      var length = parseInt($("#length").val());
      // constant function variables
      var bias_stretch= 5; // 5cm stretch went material is cut on the diagonal.
      var seam_allowance = 1.5; //1.5cm seam allowance
      var hem_allowance = 5 //5cm hem allowance
      var allowance = seam_allowance + hem_allowance ;
      var cmToIn = 0.393;
      var waistband_width = 10 + (seam_allowance*2) ;
      var clearance = 4 ;
      //derived from user variables
      if(units=='Centimeters'){
        choosenUnit = 'cm';
      }

      else if (units=='Inches'){
        choosenUnit = 'in';
        bias_stretch = bias_stretch * cmToIn;
        allowance = allowance * cmToIn ;
        waistband_width = waistband_width *cmToIn;
      }
      var adjust_waist= waist - bias_stretch; // accounts for 'bias-stretch'
      var lenghtAllow = length + allowance; //skirt length including allowance
      var waistband_lenght = waist + (allowance*2);
      // calculates radius based on full or half cirlce skirt selection
      if (skirt_type=='full'){
        circle_type = 2 * Math.PI;
        waistRadius = (adjust_waist/circle_type); // r = c/(pi * 2);
        totalRadius= lenghtAllow + waistRadius ;
        flatpatternHeight = totalRadius * 2;
        flatpatternWidth = totalRadius * 2;
      }
      else if (skirt_type=='half'){
        circle_type = Math.PI;
        waistRadius = (adjust_waist/circle_type);
        totalRadius= lenghtAllow + waistRadius ;
        flatpatternHeight = totalRadius;
        flatpatternWidth = totalRadius * 2;
      }
      flatpatternWidth = flatpatternWidth + clearance ;
      flatpatternHeight = flatpatternHeight + clearance ;
      // for debugging
      // console.log(units);
      // console.log(skirt_type);
      // console.log(flatpatternHeight);
      // console.log(waist);
      // console.log(length);
      // console.log(choosenUnit);
    
      function drawCanvas(canvasId, fabricHeight) {
        var canvas = document.getElementById(canvasId);
        var context = canvas.getContext('2d');
        var scale = 4;
        var extrawidth = 0;
        canvas.width = flatpatternWidth * scale;
        canvas.height = fabricHeight * scale;
        var centerX = (flatpatternWidth/2) ;
        var centerY = (totalRadius) + (clearance /2);

        if ((flatpatternHeight + waistband_width) < fabricHeight){
          //put waistband horizontially
          a = 0 + clearance;
          b = flatpatternHeight - (clearance /2);
          c = waistband_lenght;
          d = waistband_width;
          txtX = waistband_lenght /2;
          txtY = flatpatternHeight + (waistband_width/2);
          txt= waistband_width + " x " + waistband_lenght;
          //context.rect(0, flatpatternHeight - (clearance /2), waistband_lenght, waistband_width);
          console.log('hor');
          //console.log(flatpatternWidth,waistband_width , waistband_lenght);
        }
        else{
          //put waistband vertically and update pattern width
          a = flatpatternWidth;
          b = 0 + clearance;
          c = waistband_width;
          d = waistband_lenght;
          txtX = flatpatternWidth + (waistband_width /2);
          txtY = (clearance + waistband_lenght)/2;
          txt= waistband_width + " x " + waistband_lenght;
          canvas.width = (flatpatternWidth + waistband_width + clearance ) * scale;
          console.log('ver');
          // context.rect(flatpatternWidth , 0, waistband_width , waistband_lenght);
          //console.log(canvas.width);
          //console.log(flatpatternWidth,waistband_width , waistband_lenght);
        }
        // waist band - recetangle
        context.beginPath();
        context.scale(scale,scale);
        context.rect(a , b, c , d);
        context.stroke();
        context.closePath();
        // skirt outer cut out - circle
        context.beginPath();
        context.arc(centerX, centerY, totalRadius, 0, circle_type, true)
        // skirt inner cut out - circle
        context.arc(centerX, centerY, waistRadius, 0, circle_type, true);
        // inner radius
        context.lineTo(centerX, centerY);
        context.stroke();
        context.closePath();

       function line(startpointx,startpointy,endpointx,endpointy){
          context.beginPath();
          context.moveTo(startpointx, startpointy);
          context.lineTo(endpointx, endpointy);
          context.fill();
          context.fillStyle = '#ff0000'
          context.strokeStyle = '#ff0000';
          context.stroke();
          context.closePath();
       }
        // arrowheads
        function arrowhead(startpointx,startpointy, direction){
          RA1x = startpointx;
          RA1y = startpointy;
          arrowheadsHt = 1;
          
          if(direction == "left"){
            RA2x = startpointx + arrowheadsHt;
             RA3x = startpointx + arrowheadsHt;
          }else{
             RA2x = startpointx - arrowheadsHt;
              RA3x = startpointx - arrowheadsHt;
         }
          RA2y = startpointy + arrowheadsHt;
          RA3y = startpointy - arrowheadsHt;

          context.beginPath();
          context.moveTo(RA1x, RA1y); // give the (x,y) coordinates
          context.lineTo(RA2x, RA2y);
          context.lineTo(RA3x, RA3y);
          context.lineTo(RA1x, RA1y);
          context.fill();
          context.fillStyle = '#ff0000'
          context.strokeStyle = '#ff0000';
          context.stroke();
          context.closePath();
        }
      //draw arrowheads and lines
      arrowhead(centerX, centerY,"left");
      line(centerX,centerY,centerX+ waistRadius, centerY);
      arrowhead(centerX+ waistRadius, centerY,"right");

      arrowhead(centerX+ waistRadius, centerY,"left");
      line(centerX+ waistRadius,centerY, centerX+ totalRadius, centerY);
      arrowhead(centerX+ totalRadius , centerY,"right");

     function text(text, x ,y ){
      context.font = '3pt Calibri';
      context.fillStyle = 'blue'; // textAlign aligns text horizontally relative to placement
      context.textAlign = 'center';// textBaseline aligns text vertically relative to font style
      context.textBaseline = 'hanging';
      context.fillText( text, x, y);
     }
      r1 = Math.round(waistRadius);
      r2 = Math.round(lenghtAllow);
      text( r1+ choosenUnit , centerX, centerY);
      text( r2+ choosenUnit , centerX+ waistRadius + (lenghtAllow/2), centerY);
      text( txt , txtX, txtY);
    }
    // if statement will check, if the inputs are appropriate
     if (flatpatternHeight > 150 || flatpatternHeight == "" ){
        var displaymsg = "Sorry you will have to change your measurements";
        var errorClass = true;
        boltsize = null;
      }
      else if(flatpatternHeight < 150){
        var displaymsg = "Great you can make your skirt in 1 bolt size: bolt size 150cm";
        console.log("draw a 150")
        boltsize = 150;
        C1lenght = 150;
        drawCanvas("Canvas1",boltsize);

      if (flatpatternHeight < 115){
          var displaymsg = "Great you can make your skirt in 2 bolt size: bolt size 115cm and 150cm. You decide!";
          console.log("draw a 115")
          boltsize = 115;
          C2lenght = 115;
          drawCanvas("Canvas2",boltsize);

          if (flatpatternHeight < 90){
            var displaymsg = "Great you can make your skirt in 3 bolt size: bolt size 90cm, 115cm and 150cm. You decide!";
            console.log("draw a 90")
            boltsize = 90;
            C3lenght = 90;
            drawCanvas("Canvas3",boltsize);
          }
        }
      }

      flatpatternWidth = Math.round(flatpatternWidth);
      // Adding  user specific messages
      $( "#displaymsg" ).find(".alert-box").append("<h3>"+ displaymsg +"</h3>");
      // Adding error message if needed
      if (errorClass){
         $("#displaymsg").find(".alert-box").addClass("warning");
      }
      //chnaging class to show
      $("#displaymsg").removeClass("hide").addClass("show");

      if(flatpatternHeight < 150){
        $("#skirtpattern_makepattern").val(1);
        $("#skirtpattern_unit").val(choosenUnit);
        $("#skirtpattern_skirt_type").val(skirt_type);
        $("#skirtpattern_waist").val(waist);
        $("#skirtpattern_length").val(length);
        $("#skirtpattern_canvas1").val(flatpatternWidth);
        $("#skirtpattern_canvas2").val(flatpatternWidth);
        $("#skirtpattern_canvas3").val(flatpatternWidth);
        $("#skirtpattern_inner_radius").val(r1);
        $("#skirtpattern_outer_radius").val(r2);
        $("#skirtpattern_waistbandLgth").val(waistband_lenght);
        $("#skirtpattern_waistbandWdth").val(waistband_width);

        $( "#waistband_width" ).append( waistband_width + choosenUnit );
        $( "#waistband_lenght" ).append( waistband_lenght + choosenUnit);
        $( "#r1" ).append( r1 + choosenUnit);
        $( "#r2" ).append( r2 + choosenUnit);

        $( "#C1lenght" ).append( flatpatternWidth+ choosenUnit);
        $( "#C2lenght" ).append( flatpatternWidth+ choosenUnit);
        $( "#C3lenght" ).append( flatpatternWidth+ choosenUnit); 
        $("#c1").removeClass("hide").addClass("show");
        $("#infomsg").removeClass("hide").addClass("show");
        $("#save").removeClass("hide").addClass("show");
      }

      if(flatpatternHeight < 115){
        $("#c2").removeClass("hide").addClass("show");
      }
      if(flatpatternHeight < 90){
        $("#c3").removeClass("hide").addClass("show");
      }
    }
    //calling function above on submission of user data.
    $("#dress").on("submit", function(e){
      e.preventDefault();
      //hiding #firstgo (try it button ) from user and replacing it 'tryagain' link
      $(this).find("#firstgo").slideUp();
      $(this).find("#tryagain").removeClass("hide").addClass("show"); 
      //add refresh functionality on clicking #tryagain link
      $('#tryagain').click(function() {
          location.reload();
      });
      patternMaker();
    });


});
