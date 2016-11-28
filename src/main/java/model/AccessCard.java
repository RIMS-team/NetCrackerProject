package model;

/**
 * Created by Kristina on 23.11.2016.
 */
public class AccessCard extends AbstractInventory {

    private int cardId;

    public AccessCard(int id, String status, int cardId) {
        this.id = id;
        this.status = status;
        this.cardId = cardId;
    }

    public int getCardId() {
        return cardId;
    }

    @Override
    public String toString() {
        final StringBuilder sb = new StringBuilder("AccessCard{");
        sb.append("id='").append(id).append('\'');
        sb.append(", status='").append(status).append('\'');
        sb.append(", cardId=").append(cardId);
        sb.append('}');
        return sb.toString();
    }
}

