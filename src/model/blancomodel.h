#ifndef BLANCOMODEL_H
#define BLANCOMODEL_H

#include <QObject>
#include "gamemodel.h"

class BlancoModel : public GameModel
{
    Q_OBJECT

public:
    explicit BlancoModel(GameModel *parent = nullptr);

    Q_INVOKABLE void addPlayer(QString playerName);
    void init(QString path);


private:
    QString mRoundWord{""};
    int mNumberOfBlancoPlayers{1};
    int mNumberOfNonBlancoPlayers{1};
    QVariantList mPlayersWithWords{};
    QStringList mPlayers{};

signals:
};

#endif // BLANCOMODEL_H
