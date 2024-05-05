#ifndef BLANCOCONTROLLER_H
#define BLANCOCONTROLLER_H

#include <QObject>
#include <QQmlEngine>
class BlancoModel;

class BlancoController : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(QList<QString> players WRITE setPlayers NOTIFY playersChanged)
    Q_PROPERTY(QString currentPlayerWord READ getCurrentPlayerWord WRITE setCurrentPlayerWord NOTIFY currentPlayerWordChanged)
    Q_PROPERTY(QString currentPlayer READ getCurrentPlayer WRITE setCurrentPlayer NOTIFY currentPlayerChanged)
    Q_PROPERTY(QString gameName READ getGameName WRITE setGameName NOTIFY gameNameChanged)
    Q_PROPERTY(QString gameSimpleDescription READ getGameSimpleDescription WRITE setGameSimpleDescription NOTIFY gameSimpleDescriptionChanged)
    Q_PROPERTY(QString gameDetailedDescription READ getGameDetailedDescription WRITE setGameDetailedDescription NOTIFY gameDetailedDescriptionChanged)
    Q_PROPERTY(uchar gameMinPlayers READ getGameMinPlayers WRITE setGameMinPlayers NOTIFY gameMinPlayersChanged)
    Q_PROPERTY(uchar gameMaxPlayers READ getGameMaxPlayers WRITE setGameMaxPlayers NOTIFY gameMaxPlayersChanged)
    Q_PROPERTY(uchar gameEstimatedDuration READ getGameEstimatedDuration WRITE setGameEstimatedDuration NOTIFY gameEstimatedDurationChanged)

public:
    explicit BlancoController(QObject *parent = nullptr);

    Q_INVOKABLE void calculateWord();
    Q_INVOKABLE void distributePlayers();
    Q_INVOKABLE void shufflePlayers();
    Q_INVOKABLE void calculateCurrentPlayerAndWord();

    void setPlayers(const QList<QString> &newPlayers);

    QString getCurrentPlayerWord() const;
    void setCurrentPlayerWord(const QString &newCurrentPlayerWord);

    QString getCurrentPlayer() const;
    void setCurrentPlayer(const QString &newCurrentPlayer);

    QString getGameName() const;
    void setGameName(const QString &newGameName);

    QString getGameSimpleDescription() const;
    void setGameSimpleDescription(const QString &newGameSimpleDescription);

    QString getGameDetailedDescription() const;
    void setGameDetailedDescription(const QString &newGameDetailedDescription);

    uchar getGameMinPlayers() const;
    void setGameMinPlayers(uchar newGameMinPlayers);
    uchar getGameMaxPlayers() const;
    void setGameMaxPlayers(uchar newGameMaxPlayers);
    uchar getGameEstimatedDuration() const;
    void setGameEstimatedDuration(uchar newGameEstimatedDuration);

    void setModel(BlancoModel *blancoModel);

private:
    BlancoModel *mBlancoModel;
    // GameDefinition
    QString gameName{"Blanco"};
    QString gameSimpleDescription{"Descripción simple"};
    QString gameDetailedDescription{"Descripción detallada"};
    uchar gameMinPlayers{4};
    uchar gameMaxPlayers{99};
    uchar gameEstimatedDuration{3};

    QString currentWord{""};
    QList<QString> players{};
    QList<QString> shuffledPlayers{};
    QList<QString> blancoPlayers{};
    QList<QString> wordPlayers{};
    int numberOfBlancoPlayers{1};
    int currentIndex{0};
    QString currentPlayer{""};
    QString currentPlayerWord{""};




signals:
    void playersChanged();
    void currentPlayerWordChanged();
    void currentPlayerChanged();
    void gameNameChanged();
    void gameSimpleDescriptionChanged();
    void gameDetailedDescriptionChanged();
    void gameMinPlayersChanged();
    void gameMaxPlayersChanged();
    void gameEstimatedDurationChanged();
};

#endif // BLANCOCONTROLLER_H
