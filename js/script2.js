const var2=document.getElementsByClassName('container')
var2[0].classList.toggle('active')

    var2[0].addEventListener('click',function(e){
        if (var2[0].classList.contains('active')) {
            var2[0].classList.remove('active')
            e.target.classList.remove('active')


        }else{
            var2[0].classList.add('active')
            e.target.classList.add('active')


        }
    })

setTimeout(() => {
    var2[0].style.transform='scale(1.0)';
}, 1000);