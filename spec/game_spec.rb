# frozen_string_literal: false

# What happens in the game class?
# 1. Create the players and the board
# 2. Start the game
# 3. Players take turns
#    *- Verify the input: Only numbers 1 - 7
#     - Check that column isn't full
#     - After each turn -> Check for winner and print board

# What methods needs to be checked?
# - play -> No, since all methods are tested elsewhere
# - player_turn -> Yes, make sure that it's every other
# - player_input -> Yes, make sure that input is good
# - game_over? -> Yes, if there's a winner or a tie
