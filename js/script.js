


function fenc() {
    fetch('/')
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
            return response.text();
        })
        .then(data => {
            // Parse the HTML string using DOMParser (if in browser)
            const parser = new DOMParser();
            const doc = parser.parseFromString(data, 'text/html');

            // Find the element with ID 'playit'
            const var3 = doc.getElementById('playit');
            
            if (var3) {
                console.log(var3); // Access the element or its content
            } else {
                console.log('Element with ID "playit" not found.');
            }
            console.log('hi');
        })
        .catch(error => {
            console.error('There was a problem with the fetch operation:', error);
        });
}

fenc();


console.log('hi');
fenc();