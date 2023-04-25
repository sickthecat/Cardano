# Dashboard-Flask

First, you need to install the necessary libraries:

```python
pip install Flask requests
```


Replace `your_stake_pool_id_here` with the ID of your stake pool.

Create a new file `dashboard.html` in a folder called `templates`.


This template will display the stake pool name, description, creation epoch, number of blocks produced and missed, live stake, and a list of the pool's owners.

Now, you can run the script by typing python app.py in the terminal. The Flask server will start and you can access the dashboard by visiting http://localhost:5000 in your web browser.

Note: This is just a basic example and there are many other metrics and data that you can retrieve from the Cardano GraphQL AP
