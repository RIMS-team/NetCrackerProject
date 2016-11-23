package model.impl;

import model.Inventory;

/**
 * Created by Kristina on 23.11.2016.
 */
public class AccessCard extends AbstractInventory implements Inventory {

    private int cardId;

    public AccessCard(int cardId) {
        this.status = IN_STOCK;
        this.cardId = cardId;
    }

    public int getCardId() {
        return cardId;
    }
}
