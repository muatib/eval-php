document.addEventListener('DOMContentLoaded', function () {
    const saveButtons = document.querySelectorAll('.save-button');

    saveButtons.forEach(button => {
        button.addEventListener('click', function () {
            const transactionId = this.dataset.id;
            console.log('Transaction ID:', transactionId);

            const field = this.previousElementSibling.querySelector('.editable-field').dataset.field;
            console.log('Field:', field);

            const value = this.previousElementSibling.querySelector('.editable-field').value;
            console.log('Value:', value);

           
            fetch('update_transaction.php', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded'
                },
                body: `id=${transactionId}&field=${field}&value=${value}`
            })
            .then(response => response.json())
            .then(data => {
                console.log('Server response:', data);

                if (data.success) {
                    alert('Opération mise à jour avec succès !');
                    
                } else {
                    alert('Erreur lors de la mise à jour : ' + data.error); 
                }
            })
            .catch(error => {
                console.error('Erreur de réseau :', error);
                alert('Une erreur réseau s\'est produite.');
            });
        });
    });
});
