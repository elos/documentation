db.Model Interface
-----------------

A model embeds an data.Agent interface (namely the ability to GetID(). This is how an agent merits proves data ownership.

##### SetID(data.ID)
        Sets the id of the model, this is primarily for first time persistence. If the model already has an id set it should not be overridden.

##### Kind() data.Kind
        Supplies the database kind of the model. This is the relational table or mongo collection of this model. It is also the json string preceding any instance of this model in JSON.

##### Save(data.DB) error
        Save proxies to the db.Save(model) call

##### Concerned
        Reflects the models who care that the fundamental representation of this model's data has changed. For more see [concerened]link needed.



