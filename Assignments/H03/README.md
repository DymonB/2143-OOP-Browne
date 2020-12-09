/////////////////////////////////////////////////////////////////////
//
// Name Dymon Browne
// Date 10 November 2020
//
// Description
//  Fix Swap Method in blackjact program
//
/////////////////////////////////////////////////////////////////////



//Sorting cards in Hand
void Hand::Sort() {

    // Index "i" 
    for (int i = 0;i < Size();i++) {
        // Index "j"
        for (int j = i;j < Size() - 1;j++) {
            //Comparing cards at position i and j 
            if (Cards[i]->rank > Cards[j + 1]->rank) {
                cout << "swapping" << endl;

                // standard swap 
                Card* temp = Cards[i];

                // Change j to [j+1]
                Cards[i] = Cards[j + 1];
                Cards[j + 1] = temp;

            }
        }
    }
}
