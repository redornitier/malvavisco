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


    QStringList players();
    void setPlayers(const QStringList &newPlayers);

    QString blancoState() const;
    void setBlancoState(const QString &newBlancoState);

private:
    QString mBlancoState{"AddPlayers"};
    QString mRoundWord{""};
    int mNumberOfBlancoPlayers{1};
    int mNumberOfNonBlancoPlayers{1};
    QVariantList mPlayersWithWords{};
    QStringList mPlayers{""};

    Q_PROPERTY(QString blancoState READ blancoState WRITE setBlancoState NOTIFY blancoStateChanged FINAL)

    Q_PROPERTY(QStringList players READ players WRITE setPlayers NOTIFY playersChanged FINAL)

signals:
    void blancoStateChanged();
    void playersChanged();
};

#endif // BLANCOMODEL_H
