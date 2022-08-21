======
MLflow
======

MLflow is a package for managing the machine learning life cycle. It has modules for dealing with different parts of the life cycle. In this article, we cover the basics of the following modules:

* MLflow Models
* MLflow Tracking
* MLflow Projects

-------------
MLflow Models
-------------

MLflow Models is a standard format for packaging and saving models. Note that this format cannot be used on any type of model. Scikit-learn models are an example of models that can be saved by MLflow.

.. code-block:: python

    import mlflow
    from sklearn.linear_model import LogisticRegression 

    model = LogisticRegression()
    mlflow.sklearn.save_model(model, "my_model")

This creates a directory called :code:`my_model` with the following structure.

.. code-block::

    my_model/
    ├── MLmodel
    ├── model.pkl
    ├── conda.yaml
    ├── python_env.yaml
    └── requirements.txt

This directory contains the model itself (:code:`model.pkl`), the dependencies need to run the model (:code:`conda.yaml`, :code:`python_env.yaml`, and :code:`requirement.txt`), and a file containing metadata about the model (:code:`MLmodel`).

.. code-block:: yaml
   :caption: MLmodel

   flavors:
     python_function:
       env: conda.yaml
       loader_module: mlflow.sklearn
       model_path: model.pkl
       python_version: 3.8.10
     sklearn:
       code: null
       pickled_model: model.pkl
       serialization_format: cloudpickle
       sklearn_version: 1.1.2
    mlflow_version: 1.28.0
    model_uuid: 51eb5f8bb95645ef88a486f49bbd0d4a
    utc_time_created: '2022-08-21 14:21:07.624215'

This folder structure and :code:`MLmodel` will not be exactly the same for all types of models. But they will be similar.

^^^^^^^^^^^^^^^^
Model Signatures
^^^^^^^^^^^^^^^^

Model signatures are a way of storing the kinds of inputs needed for the model.

---------------
MLflow Tracking
---------------

---------------
MLflow Projects
---------------

