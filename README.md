# star_wars_planets

A visual guide to Star Wars planets


Questo progetto è ottimizzato per cellulari Android e iOS con svariate dimensioni.

L'architettura utilizzata è ibrida ma improntata al principio di singola responsabilità. Si è cercato 
di riutilizzare la maggior parte dei componenti e di mantenere la struttura semplice.

Per questo per pagine Login e Registration utilizzano StatefulWidget mantenendo la maggior parte degli elementi UI
e business logic, che sono pochi, nella pagina stessa, relegando altrove solo la gestione delle chiamate.

Per la pagina Planets si è scelto di utilizzare Provider per una gestione dello stato più efficiente,
data la maggiore complessità, e per implementare un pattern MVVM, per una migliore suddivisione del codice.

Le chiamate e la loro gestione sono nel RemoteDataSource. Il pacchetto HTTP è lo standard su Flutter
per le chiamate HTTP.

Gli aspetti di stile sono stati centralizzati nella cartella Theme. Viene forzato il dark theme perchè
più vicino come base al risultato desiderato, la maggior parte delle voci è stata comunque personalizzata
con colori ed elementi che riprendessero la saga di Star Wars.

La navigazione è stata mantenuta semplice, con l'utilizzo di Navigator 1.0, coerentemente con la struttura 
semplice e lineare dell'app.

La UI è stata definita cercando di ottenere la UX più efficace possibile e di seguire le guidelines
per lo sviluppo Mobile. La maggior parte dei button e degli elementi cliccabili si trova nella parte bassa
dello schermo. I colori sono ben contrastati e funzionali alla navigazione lineare dell'app.

