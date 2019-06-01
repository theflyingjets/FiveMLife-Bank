$(function(){
	window.onload = (e) => {
        /* 'links' the js with the Nui message from main.lua */
		window.addEventListener('message', (event) => {
            //document.querySelector("#logo").innerHTML = " "
			var item = event.data;
			var fnTData = event.data.fName;
			var lnTData = event.data.lName;
			var BalTData = event.data.bal;
			var AcTData = event.data.acNumber;
			
			if (item !== undefined && item.type === "ui") {
				$('.fnData').html(fnTData);
				$('.lnData').html(lnTData);
				$('.Baldata').html(BalTData);
				$('.AcData').html(AcTData);
                /* if the display is true, it will show */
				if (item.display === true) {
					$(".hidden").show();
                     /* if the display is false, it will hide */
				} else {
					$(".hidden").hide();
				}
			}
		});
	};
});

document.addEventListener('DOMContentLoaded', () => {
	(document.querySelectorAll('.notification .delete') || []).forEach(($delete) => {
	  $notification = $delete.parentNode;
	  $delete.addEventListener('click', () => {
		$notification.parentNode.removeChild($notification);
	  });
	});
  });