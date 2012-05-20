# Convertisseur de markdown vers HTML puis ensuite vers PDF

* programme qui converti un fichier markdown + template haml/sass en page HTML puis en document PDF.
* utilité: documents ayudo (cahiers des charges, …), …

* goal: kill word

exemple d'utilisation:

> Génère document.html avec ayudo.haml comme template et document.md comme contenu

    $ md2html.rb document.md ayudo.haml

> avec webkit2pdf, ou une autre fonction du soft

    webkit2pdf document.html document.pdf
