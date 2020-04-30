
/* Vinvoli referenziali    */        

UPDATE studente

SET matricolaStudente = NULL;

UPDATE studente

SET corsoLaurea = NULL;

UPDATE studente

SET nome = NULL;

UPDATE studente

SET codiceFiscale = 111222333;

UPDATE studente

SET matricolaStudente = 55555;

UPDATE docente

SET matricola = 44444;

UPDATE modulo

SET codice = 343434;




ALTER TABLE studente

DROP COLUMN codiceSede;







