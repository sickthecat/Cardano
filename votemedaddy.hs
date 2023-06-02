-- Importing necessary modules
import qualified PlutusTx
import PlutusTx.Prelude
import Ledger

-- Data type to represent a voting option
data Option = Option
    { optionName :: !ByteString  -- Name of the voting option
    , voteCount  :: !Integer     -- Number of votes received
    }

-- Data type to represent the voting contract state
data VotingState = VotingState
    { options :: ![Option]  -- List of voting options
    , totalVotes :: !Integer -- Total number of votes
    }

-- Function to create a new voting contract
newVoting :: [ByteString] -> VotingState
newVoting names = VotingState
    { options = map (\name -> Option name 0) names
    , totalVotes = 0
    }

-- Function to vote for an option
vote :: ByteString -> VotingState -> VotingState
vote optionName state@(VotingState { options = opts, totalVotes = votes }) =
    case find (\opt -> optionName == optionName opt) opts of
        Just opt ->
            let newOpts = map (\o -> if optionName == optionName o then incrementVote o else o) opts
                newVotes = votes + 1
            in VotingState newOpts newVotes
        Nothing -> state

-- Helper function to increment vote count
incrementVote :: Option -> Option
incrementVote (Option name count) = Option name (count + 1)

-- Main contract endpoint for voting
voteEndpoint :: VotingState -> Promise () VotingState
voteEndpoint state = endpoint @"vote" $ \(optionName :: ByteString) ->
    if isValidOption optionName state
        then do
            let newState = vote optionName state
            logInfo @String $ "Voted for option: " ++ show optionName
            pure newState
        else throwError "Invalid voting option"

-- Helper function to check if an option is valid
isValidOption :: ByteString -> VotingState -> Bool
isValidOption optionName state = any (\opt -> optionName == optionName opt) (options state)

-- Main contract entry point
votingContract :: Contract () VotingState
votingContract = do
    logInfo @String "Starting voting contract"
    let initialState = newVoting ["Option A", "Option B", "Option C"]
    curState <- foldM voteEndpoint initialState
    logInfo @String $ "Voting completed. Current state: " ++ show curState
    pure curState
