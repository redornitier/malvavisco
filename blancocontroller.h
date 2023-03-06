#ifndef BLANCOCONTROLLER_H
#define BLANCOCONTROLLER_H

#include <QObject>
#include <QQmlEngine>

class BlancoController : public QObject
{
    Q_OBJECT
    QML_ELEMENT
    Q_PROPERTY(QList<QString> players WRITE setPlayers NOTIFY playersChanged)
    Q_PROPERTY(QString currentPlayerWord READ getCurrentPlayerWord WRITE setCurrentPlayerWord NOTIFY currentPlayerWordChanged)
    Q_PROPERTY(QString currentPlayer READ getCurrentPlayer WRITE setCurrentPlayer NOTIFY currentPlayerChanged)

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

private:
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
};

#endif // BLANCOCONTROLLER_H
