from flask import Flask, render_template
import requests

app = Flask(__name__)

# Define the GraphQL query to retrieve stake pool information
QUERY = """
query {
  stakePool(id: "%s") {
    id
    name
    description
    createdAt {
      epoch {
        id
      }
    }
    blocksProduced {
      totalCount
    }
    blocksMissed {
      totalCount
    }
    liveStake {
      quantity
    }
    owners {
      name
      address
    }
  }
}
"""

# Replace this with the ID of your stake pool
STAKE_POOL_ID = "your_stake_pool_id_here"

# Define a function to retrieve stake pool information from the Cardano GraphQL API
def get_stake_pool_info():
    response = requests.post("https://graphql-api.mainnet.dandelion.link/",
                             json={"query": QUERY % STAKE_POOL_ID})
    if response.status_code == 200:
        data = response.json()["data"]["stakePool"]
        return data
    else:
        return None

# Define a route for the dashboard
@app.route("/")
def dashboard():
    data = get_stake_pool_info()
    return render_template("dashboard.html", data=data)

if __name__ == "__main__":
    app.run(debug=True)
